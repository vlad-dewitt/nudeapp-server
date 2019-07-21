module.exports = {
  servers: {
    one: {
      host: '18.188.44.100',
      username: 'ubuntu',
      pem: '../../../keys/nudeapp.pem'
    }
  },

  app: {
    name: 'poster',
    path: '../',

    servers: {
      one: {},
    },

    buildOptions: {
      serverOnly: true,
    },

    env: {
      ROOT_URL: 'http://18.188.44.100',
      MONGO_URL: 'mongodb://mongodb/meteor',
      MONGO_OPLOG_URL: 'mongodb://mongodb/local',
    },

    docker: {
      image: 'zodern/meteor:root'
    },

    enableUploadProgressBar: true
  },

  mongo: {
    version: '3.4.1',
    servers: {
      one: {}
    }
  },

  proxy: {
    domains: '18.188.44.100',

    ssl: {
      letsEncryptEmail: 'vlad@hexa.systems',
      forceSSL: true
    }
  }
};
