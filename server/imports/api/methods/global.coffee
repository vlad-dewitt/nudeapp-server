export default
  getInitConfig: (data) ->
    future = new Future()

    App = APP.findOne()

    res =
      config:
        welcomeMessage: "Welcome!"
        language: App.config.languages[0]

    future.return
      code: 'S'
      message: ''
      data: res

    future.wait()
