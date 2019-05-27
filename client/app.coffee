import { render } from 'react-dom'
import { Provider } from 'react-redux'
import { ConnectedRouter as Router, routerMiddleware } from 'connected-react-router'
import { createBrowserHistory } from 'history'
import { createStore, applyMiddleware } from 'redux'
import { composeWithDevTools } from 'redux-devtools-extension'

import Redux from './imports/genius/redux'
import { ThemeProvider } from 'react-jss'
import { Theme } from '/client/imports/genius/hybrid'

import '/client/lib/global_scope'

import App from './imports/kit'



history = createBrowserHistory()



if Meteor.isDevelopment
  @STORE = createStore Redux(history), composeWithDevTools applyMiddleware routerMiddleware(history)
else
  @STORE = createStore Redux(history), applyMiddleware routerMiddleware(history)



Meteor.startup ->
  render <Provider store={ STORE }>
      <Router history={ history } >
        <ThemeProvider theme={ Theme }>
          <App/>
        </ThemeProvider>
      </Router>
    </Provider>, document.getElementById 'root'
