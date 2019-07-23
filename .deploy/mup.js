module.exports = {
  servers: {
    one: {
      host: 'nudeapp.tenhundred.com',
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
      ROOT_URL: 'https://nudeapp.tenhundred.com',
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
    domains: 'nudeapp.tenhundred.com',

    ssl: {
      letsEncryptEmail: 'vlad@hexa.systems',
      forceSSL: true
    }
  }
};
