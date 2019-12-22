export default
  APP: =>
    APP = new Mongo.Collection 'app'

    if APP.find().count() is 0
      APP.insert
        id: 'APP'
        config:
          'languages': [ 'en' ]
          'ios_url': ''
          'android_url': ''
          'video_available': no

    APP
