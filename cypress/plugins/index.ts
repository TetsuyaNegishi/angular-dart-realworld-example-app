const wp = require('@cypress/webpack-preprocessor')

module.exports = (on: any) => {
  const options = {
    webpackOptions: {
      resolve: {
        extensions: [".ts", ".js"]
      },
    },
  }
  on('file:preprocessor', wp(options))
}
