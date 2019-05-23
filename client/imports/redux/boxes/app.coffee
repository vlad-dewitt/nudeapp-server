origin =
  status:
    user: Meteor.userId() isnt null
    loaded: no



export default (state = origin, act) ->
  switch act.type

    when 'setInitConfig'
      state = { state... }

      state.config = act.data

      state



    when 'setAppLoaded'
      state = { state... }

      state.status.loaded = yes

      state



    when 'changeWelcomeMessage'
      state = { state... }

      state.config.welcomeMessage = if state.config.welcomeMessage is "Welcome!" then "Fuck You!" else "Welcome!"

      state



    else state
