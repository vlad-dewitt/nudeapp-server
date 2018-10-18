origin =
  user: Meteor.userId() isnt null
  welcomeMessage: "Welcome!"



export default (state = origin, action) ->
  switch action.type

    when 'CHANGE_WELCOME_MESSAGE'
      switch state.welcomeMessage
        when "Welcome!"
          window.speechSynthesis.cancel()
          window.speechSynthesis.speak new SpeechSynthesisUtterance "Fuck you!"
          state = {
            origin...
            welcomeMessage: "Fuck you!"
          }
        else
          window.speechSynthesis.cancel()
          window.speechSynthesis.speak new SpeechSynthesisUtterance "Welcome!"
          state = {
            origin...
            welcomeMessage: "Welcome!"
          }

    else state
