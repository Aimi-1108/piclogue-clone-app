process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

environment.config.merge({
  devServer: {
    host: 'localhost',
    port: 3035,
    https: false,
    headers: {
      'Access-Control-Allow-Origin': '*'
    },
    disableHostCheck: true,
    compress: true,
    overlay: true,
    inline: true
  }
})

module.exports = environment.toWebpackConfig()
