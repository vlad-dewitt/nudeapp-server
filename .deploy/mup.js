module.exports = {
  servers: {
    one: {
      host: 'thenudeapp.com',
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
      ROOT_URL: 'https://thenudeapp.com',
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
    domains: 'thenudeapp.com',

    ssl: {
      letsEncryptEmail: 'vlad@hexa.systems',
      forceSSL: true
    }
  }
};
