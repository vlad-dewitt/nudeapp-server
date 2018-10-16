import connectMeteor from 'react-redux-meteor-data'
import { withRouter } from 'react-router-dom'



connectStates = (state) ->
  app: state.app

connectTracker = () ->
  # collectionName = collectionName.find({}).fetch()
  collectionName = {}

connectTransfer = (transfer, props) ->
  changeWelcomeMessage: ->
    transfer
      type: 'CHANGE_WELCOME_MESSAGE'



outfit = (component) ->
  withRouter(connectMeteor(connectTracker, connectStates, connectTransfer)(component))



export { outfit }
