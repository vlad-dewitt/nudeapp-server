export default Transfer = (transfer, props) ->
  changeWelcomeMessage: ->
    transfer
      type: 'CHANGE_WELCOME_MESSAGE'
