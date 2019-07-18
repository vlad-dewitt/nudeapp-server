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



  # Server

  Picker.route '/user/create', (params, req, res, next) =>
    console.log '=================> REQUEST'
    console.log req.body

    timestamp = new Date().getTime();
    data = req.body

    confirmToken = random 'A0', 4
    referralCode = random 'A0', 6

    findUser = Meteor.users.findOne({ 'profile.deviceId': data.deviceInfo })

    if findUser
      if Accounts.findUserByEmail data.email
        response = JSON.stringify
          status: 'User Exists and email recognized'
          device_id_found: yes
          email_with_device_id_found: yes
          user: data
        res.end response
      else
        response = JSON.stringify
          status: 'User Exists and email not recognized'
          device_id_found: yes
          email_with_device_id_found: no
          user: data
        res.end response
    else
      Accounts.createUser
        email: data.email
        profile:
          on_trial: no
          confirmToken: confirmToken
          emailConfirmed: no
          imageProcessed: 0
          referralCode: referralCode
          referrerCode: data.referrer
          expires: null
          deviceId: data.deviceInfo
          createdAt: timestamp
          updatedAt: timestamp
      response = JSON.stringify
        email: data.email
        referralCode: referralCode
        device_id_found: no
        email_with_device_id_found: no
      res.end response



  # Test requests

  headers =
    'Content-Type': 'application/json; charset=utf-8'

  user_data =
    email: 'vadik@email.com'
    referrer: ''
    deviceInfo: 'blablabla'
    account_created_at: new Date()
    pin: '6666'
    device_id: '1234567890'
    user_referral_code: ''
    referral_code_used: ''
    emails: [
      { email: 'vadik@email.com' }
    ]

  HTTP.post 'http://localhost:3000/user/create', { headers: headers, content: JSON.stringify user_data }, (err, res) =>
    console.log '<================= RESPONSE'
    if err
      console.error err
    else
      console.log res.statusCode
      console.log JSON.parse res.content



  Meteor.methods {
    global...
  }
