import React, { Component } from 'react'
import { createContext } from 'react'

import { Route, Switch, Redirect, Link } from 'react-router-dom'

import Helmet from 'react-helmet'

import { Hybrid, Ambry } from '/client/imports/genius/hybrid'

import API from '/client/imports/api/global.coffee'

import classNames from 'classnames'

import anime from 'animejs'
import $ from 'jquery'

import Animations from '/client/imports/ui/animations/kit'

import random from 'randomatic'
import IS from 'is_js'



@React = React
@Component = Component
@createContext = createContext

@Route = Route
@Switch = Switch
@Redirect = Redirect
@Link = Link

@Helmet = Helmet

@Hybrid = Hybrid
@Ambry = Ambry

@API = API

@classNames = classNames

@anime = anime
@$ = $

@Animations = Animations

@random = random
@IS = IS
