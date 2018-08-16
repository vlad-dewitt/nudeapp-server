import { Meteor } from 'meteor/meteor'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { ConnectedRouter as Router, routerMiddleware } from 'react-router-redux'
import createHistory from 'history/createBrowserHistory'
import { browserHistory } from 'react-router'
import { createStore, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'
import { composeWithDevTools } from 'redux-devtools-extension'

import reducers from './imports/reducers/kit'

import App from './imports/kit'



history = createHistory()
middleware = routerMiddleware(history)

if Meteor.isDevelopment
  store = createStore(reducers, composeWithDevTools(applyMiddleware(middleware, thunk)))
else
  store = createStore(reducers, applyMiddleware(middleware, thunk))



Meteor.startup ->
  render <Provider store={ store }>
      <Router history={ history }>
        <App/>
      </Router>
    </Provider>, document.getElementById('root')
