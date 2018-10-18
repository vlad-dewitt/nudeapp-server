import connectMeteor from 'react-redux-meteor-data'
import { withRouter } from 'react-router-dom'

import States from '../reducers/states'
import Tracker from '../reducers/tracker'
import Transfer from '../reducers/transfer'



outfit = (component) ->
  withRouter connectMeteor(Tracker, States, Transfer)(component)



export { outfit }
