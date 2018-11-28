import { Meteor } from 'meteor/meteor'
import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { ConnectedRouter as Router, routerMiddleware } from 'connected-react-router'
import { createBrowserHistory } from 'history'
import { createStore, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'
import { composeWithDevTools } from 'redux-devtools-extension'

import reducers from './imports/reducers/kit'

import App from './imports/kit'



history = createBrowserHistory()



if Meteor.isDevelopment
  store = createStore reducers(history), composeWithDevTools applyMiddleware routerMiddleware(history), thunk
else
  store = createStore reducers(history), applyMiddleware routerMiddleware(history), thunk



Meteor.startup ->
  render <Provider store={ store }>
      <Router history={ history }>
        <App/>
      </Router>
    </Provider>, document.getElementById 'root'
