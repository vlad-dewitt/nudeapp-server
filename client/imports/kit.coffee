import React, { Component } from 'react'
import { Route, Switch, Redirect } from 'react-router-dom'
import { outfit } from '/client/imports/tools/outfit'



App = class extends Component
  constructor: (props) ->
    super props
    @state = {}



  render: ->
    <div id='App' onClick={ @props.changeWelcomeMessage }>
      <h1 id='welcome'>{ @props.app.welcomeMessage }</h1>
    </div>



export default outfit App
