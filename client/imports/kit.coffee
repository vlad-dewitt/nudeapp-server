import React, { Component } from 'react'
import { Route, Switch, Redirect } from 'react-router-dom'
import { outfit } from '/client/imports/tools/outfit'

import Welcome from './components/welcome/kit'



App = class extends Component
  constructor: (props) ->
    super props
    @state = {}



  render: =>
    <div id='App' onClick={ @props.changeWelcomeMessage }>
      <Welcome />
    </div>



export default outfit App
