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



  Picker.route '/user/create', (params, req, res, next) =>
    console.log '=================> REQUEST'
    console.log req.body
    list = Meteor.users.find().fetch()
    res.end JSON.stringify req.body


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

  HTTP.post 'http://4e919b61.ngrok.io/user/create', { headers: headers, content: JSON.stringify user_data }, (err, res) =>
    console.log '<================= RESPONSE'
    if err
      console.error err
    else
      console.log res



  Meteor.methods {
    global...
  }
