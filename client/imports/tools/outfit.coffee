import connectMeteor from 'react-redux-meteor-data'
import { withRouter } from 'react-router-dom'



connectStates = (state) ->
  app: state.app

connectTracker = () ->
  # collectionName = collectionName.find({}).fetch()
  collectionName = {}

connectTransfer = (transfer, props) ->
  onGetUser: (user) ->
    transfer
      type: 'GET_USER'
      load: user



outfit = (component) ->
  withRouter(connectMeteor(connectTracker, connectStates, connectTransfer)(component))



export { outfit }
