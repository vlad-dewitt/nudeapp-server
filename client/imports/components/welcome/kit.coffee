import React, { Component } from 'react'
import { Route, Switch, Redirect } from 'react-router-dom'
import { outfit } from '/client/imports/tools/outfit'


Welcome = class extends Component
  constructor: (props) ->
    super props
    @state = {}



  render: =>
    <div id='Welcome'>
      <h1>{ @props.app.welcomeMessage }</h1>
    </div>



export default outfit Welcome
