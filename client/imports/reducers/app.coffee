origin =
  user: Meteor.userId() isnt null
  welcomeMessage: "Welcome!"

export default (state = origin, action) ->
  switch action.type

    when 'CHANGE_WELCOME_MESSAGE'
      switch state.welcomeMessage
        when "Welcome!"
          state = {
            origin...
            welcomeMessage: "Fuck you!"
          }
        else
          state = {
            origin...
            welcomeMessage: "Welcome!"
          }

    else state
