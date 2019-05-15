export default (transfer, props) ->

  getInitConfig: (data) ->
    Meteor.call 'getInitConfig', data, (err, res) ->
      if err
        console.log err
      else
        transfer
          type: 'SET_INIT_CONFIG'
          payload: res.data



  setAppLoaded: ->
    transfer
      type: 'SET_APP_LOADED'
