export default
  APP: ->
    APP = new Mongo.Collection 'app'

    if APP.find().count() is 0
      APP.insert
        id: 'APP'
        config:
          'languages': [ 'en' ]

    APP
