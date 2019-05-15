import '/server/lib/global_scope'

import init from './imports/operations/init'

import global from './imports/api/methods/global'



@APP = init.APP()



Meteor.startup ->
  console.log "----------------------------------------------------------------------------"
  console.log "|                       Server started successfully                        |"
  console.log "----------------------------------------------------------------------------"



  Meteor.methods {
    global...
  }
