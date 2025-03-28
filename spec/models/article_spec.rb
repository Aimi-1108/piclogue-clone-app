require 'rails_helper'
RSpec.describe Article, type: :model do
  let!(:user) { create(:user, email: 'test@test.com') }

  context 'タイトルと内容が入力されている場合' do
    let!(:article) { build(:article, user: user) }


    it '記事を保存できる' do
      expect(article).to be_valid
      puts user.email
    end
  end

  context 'タイトルの文字が一文字の場合' do
    let!(:article) { build(:article, title: Faker::Lorem.characters(number: 1), user: user)}

    it '記事を保存できない' do
      article.save
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end