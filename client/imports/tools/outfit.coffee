import { withTracker } from 'meteor/react-meteor-data'
import connectMeteor from 'react-redux-meteor-data'
import { withRouter } from 'react-router-dom'



connectStates = (state) ->
  app: state.app

connectTracker = () ->
  # collectionName = collectionName.find({}).fetch()
  collectionName = {}

connectTransfer = (transfer, props) ->
  onGetUser: (user) ->
    dispatch
      type: 'GET_USER'
      load: user



outfit = (component) ->
  withRouter(connectMeteor(connectTracker, connectStates, connectTransfer)(component))



export { outfit }
