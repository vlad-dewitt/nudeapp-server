import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'

import States from './states'
import Transfer from './transfer'
# import Tracker from '../reducers/tracker'
import Hybrid from './hybrid'



outfit = (component) ->
  withRouter connect(States, Transfer, Hybrid)(component)



export { outfit }
