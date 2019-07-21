import '/server/lib/global_scope'

import init from './imports/operations/init'

import global from './imports/api/methods/global'

import bodyParser from 'body-parser'



@APP = init.APP()

Picker.middleware bodyParser.json()
Picker.middleware bodyParser.urlencoded { extended: false }



Meteor.startup =>
  console.log "----------------------------------------------------------------------------"
  console.log "|                       Server started successfully                        |"
  console.log "----------------------------------------------------------------------------"



  process.env.MAIL_URL = 'smtps://apikey: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@smtp.sendgrid.net:465'



  Meteor.methods {
    global...
  }



  # API

  Picker.route '/user/create', (params, req, res, next) =>
    console.log '=================> REQUEST CREATE USER'
    console.log req.body

    timestamp = new Date().getTime();
    data = req.body

    confirmToken = random '0', 6
    referralCode = random 'A0', 6

    findUser = Meteor.users.findOne({ 'profile.deviceId': data.deviceInfo })

    if findUser
      if data.email.length > ''
        if Accounts.findUserByEmail data.email
          findUser = {
            findUser...
            findUser.profile...
          }
          delete findUser.profile
          response = JSON.stringify
            status: 'User Exists and email recognized'
            device_id_found: yes
            email_with_device_id_found: yes
            user: findUser
          res.statusCode = 200
          res.end response
        else
          findUser = {
            findUser...
            findUser.profile...
          }
          delete findUser.profile
          response = JSON.stringify
            status: 'User Exists and email not recognized'
            device_id_found: yes
            email_with_device_id_found: no
            user: findUser
          res.statusCode = 200
          res.end response
      else
        Accounts.addEmail(data.deviceInfo, data.email)
        Meteor.users.update({username: data.deviceInfo}, {'profile.email': data.email})
        findUser = {
          findUser...
          findUser.profile...
        }
        delete findUser.profile
        response = JSON.stringify
          status: 'User Exists and email not recognized'
          device_id_found: yes
          email_with_device_id_found: no
          user: findUser
        res.statusCode = 200
        res.end response
    else
      if data.email.length > 0
        user_object =
          username: data.deviceInfo
          email: data.email
          profile:
            email: data.email
            on_trial: no
            confirmToken: confirmToken
            emailConfirmed: no
            imageProcessed: 0
            referralCode: referralCode
            referrerCode: data.referrer
            expires: moment(timestamp).add(3, 'year').toDate()
            deviceId: data.deviceInfo
            createdAt: timestamp
            updatedAt: timestamp
      else
        user_object =
          username: data.deviceInfo
          profile:
            email: ''
            on_trial: no
            confirmToken: confirmToken
            emailConfirmed: no
            imageProcessed: 0
            referralCode: referralCode
            referrerCode: data.referrer
            expires: moment(timestamp).add(3, 'year').toDate()
            deviceId: data.deviceInfo
            createdAt: timestamp
            updatedAt: timestamp
      Accounts.createUser user_object
      user_object = {
        user_object...
        user_object.profile...
      }
      delete user_object.profile
      response = JSON.stringify
        email: data.email
        referralCode: referralCode
        device_id_found: no
        email_with_device_id_found: no
        user: user_object
      res.statusCode = 200
      res.end response



  Picker.route '/user/check_user', (params, req, res, next) =>
    console.log '=================> REQUEST CHECK USER'
    console.log req.body

    data = req.body

    user = Meteor.users.findOne({ 'profile.deviceId': data.deviceInfo })

    if user
      if data.email
        if Accounts.findUserByEmail data.email
          user_object = {
            user...
            user.profile...
          }
          delete user_object.profile
          response = JSON.stringify
            status: 'User Exists and email recognized'
            device_id_found: yes
            email_with_device_id_found: yes
            user: user_object
          res.statusCode = 200
          res.end response
        else
          user_object = {
            user...
            user.profile...
          }
          delete user_object.profile
          response = JSON.stringify
            status: 'User Exists and email not recognized'
            device_id_found: yes
            email_with_device_id_found: no
            user: user_object
          res.statusCode = 200
          res.end response
      else
        user_object = {
          user...
          user.profile...
        }
        delete user_object.profile
        response = JSON.stringify
          status: 'User Exists and email not recognized'
          device_id_found: yes
          email_with_device_id_found: no
          user: user_object
        res.statusCode = 200
        res.end response
    else
      response = JSON.stringify
        status: 'User doesn\'t exist'
        device_id_found: no
        email_with_device_id_found: no
      res.statusCode = 200
      res.end response



  Picker.route '/user/delete_account', (params, req, res, next) =>
    console.log '=================> REQUEST DELETE ACCOUNT'
    console.log req.body

    data = req.body

    Meteor.users.remove({ username: data.deviceInfo })

    response = JSON.stringify
      deleted: yes

    res.statusCode = 200
    res.end response



  Picker.route '/user/reset_email', (params, req, res, next) =>
    console.log '=================> REQUEST CHANGE EMAIL'
    console.log req.body

    data = req.body

    findUser = Meteor.users.findOne({ 'username': data.deviceInfo })

    if findUser
      if findUser.profile.email.length > 0
        Accounts.removeEmail findUser._id, findUser.profile.email
      if Accounts.findUserByEmail data.newEmail
        response = JSON.stringify
          status: 'Failed'
        res.statusCode = 200
        res.end response
      else
        Accounts.addEmail findUser._id, data.newEmail
        Meteor.users.update({ username: data.deviceInfo }, { $set: { 'profile.email': data.newEmail } })
        response = JSON.stringify
          status: 'Done'
        res.statusCode = 200
        res.end response
    else
      response = JSON.stringify
        status: 'Failed'
      res.statusCode = 200
      res.end response



  Picker.route '/user/send_reset_passcode_token', (params, req, res, next) =>
    console.log '=================> REQUEST RESET PASSCODE'
    console.log req.body

    data = req.body
    token = random '0', 6

    findUser = Meteor.users.findOne({ 'username': data.deviceInfo })

    if findUser
      Meteor.users.update({ username: data.deviceInfo }, { $set: { 'profile.confirmToken': token } })
      Meteor.call 'sendConfirmationEmail', data.email, token
      response = JSON.stringify
        status: 'sent to user\'s email'
      res.statusCode = 200
      res.end response
    else
      response = JSON.stringify
        status: 'user not found'
      res.statusCode = 200
      res.end response



  Picker.route '/user/confirm_token', (params, req, res, next) =>
    console.log '=================> REQUEST CONFIRM TOKEN'
    console.log req.body

    data = req.body

    findUser = Meteor.users.findOne({ 'username': data.deviceInfo, 'profile.confirmToken': data.token })

    if findUser
      Meteor.users.update({ username: data.deviceInfo }, { $set: { 'profile.confirmToken': '000000' } })
      response = JSON.stringify
        confirmed: yes
      res.statusCode = 200
      res.end response
    else
      response = JSON.stringify
        confirmed: no
      res.statusCode = 200
      res.end response



  Picker.route '/photo/check_nudity', (params, req, res, next) =>
    console.log '=================> REQUEST CHECK NUDITY'
    console.log req.body

    data = req.body

    findUser = Meteor.users.findOne({ 'username': data.deviceInfo, 'profile.confirmToken': data.token })

    if findUser
      response = JSON.stringify
        status: 'Success'
      res.statusCode = 200
      res.end response
    else
      response = JSON.stringify
        status: 'Failed'
      res.statusCode = 200
      res.end response
