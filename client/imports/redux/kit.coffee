import { combineReducers } from 'redux'
import { connectRouter } from 'connected-react-router'

import app from './states/app'



export default (history) ->
  combineReducers
    router: connectRouter history
    app: app
