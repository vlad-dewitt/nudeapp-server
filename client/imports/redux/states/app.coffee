origin =
  status:
    user: Meteor.userId() isnt null
    loaded: no



export default (state = origin, action) ->
  switch action.type

    when 'SET_INIT_CONFIG'
      state = { state... }

      state.config = action.payload.config

      state



    when 'SET_APP_LOADED'
      state = { state... }

      state.status.loaded = yes

      state



    else state
