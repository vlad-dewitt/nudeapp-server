import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'

import Hunter from './hunter'
Hunter()



Ambry =
  call: (id, data) =>
    if not data
      STORE.dispatch
        type: id
    else
      STORE.dispatch
        type: id
        data: data



Merge = (state, acts, props) ->
  {
    props...
    app: {
      state.app...
    }
  }

States = (state, props) ->
  app: state.app



Hybrid = (component) ->
  withRouter connect(States, null, Merge)(component)



export { Hybrid, Ambry }
