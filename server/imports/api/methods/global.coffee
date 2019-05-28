export default
  getInitConfig: (data) =>
    future = new Future()

    App = APP.findOne()

    config =
      welcomeMessage: "Welcome!"
      language: App.config.languages[0]

    future.return
      code: 'S'
      message: ''
      data: config

    future.wait()
