import { connect } from 'react-redux'

import { withRouter } from 'react-router-dom'

import withStyles from 'react-jss'
import { Theme, Stylus } from '/client/imports/ui/shape/global'

import Hunter from './hunter'
Hunter()

import API from './api/kit'



States = (state, props) ->
  { state... }



Hybrid = (component, shape) ->
  if shape
    withRouter connect(States, null)(withStyles(shape)(component))
  else
    withRouter connect(States, null)(withStyles(Stylus)(component))

Ambry =
  call: (id, data) =>
    if not data
      STORE.dispatch
        type: id
    else
      STORE.dispatch
        type: id
        data: data



export { Hybrid, API, Ambry, Theme, Stylus }
