import React, { Component } from 'react'
import { createContext } from 'react'

import { Route, Switch, Redirect, Link } from 'react-router-dom'

import { Hybrid, Ambry } from '/client/imports/redux/hybrid'

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

@Hybrid = Hybrid
@Ambry = Ambry

@classNames = classNames

@anime = anime
@$ = $

@Animations = Animations

@random = random
@IS = IS
