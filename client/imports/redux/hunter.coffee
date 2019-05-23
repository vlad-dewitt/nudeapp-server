# Sessions = new Mongo.Collection 'sessions'



export default Hunter = ->

  Tracker.autorun ->

    Meteor.subscribe 'sessions'

    # sessions = Sessions.find({}, { sort: { peopleAhead: 1 } }).fetch()
    #
    # if window.STORE
    #
    #   STORE.dispatch
    #     type: 'CHECK_SESSIONS'
    #     payload: sessions
