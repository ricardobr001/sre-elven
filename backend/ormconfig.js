module.exports = [
  {
    "type": "postgres",
    "host": process.env.POSTGRES_HOST,
    "port": process.env.POSTGRES_PORT,
    "username": process.env.POSTGRES_USERNAME,
    "password": process.env.POSTGRES_PASSWORD,
    "database": process.env.POSTGRES_DATABASE,
    "entities": ["./dist/modules/**/infra/typeorm/entities/*.js"],
    "migrations": ["./dist/shared/infra/typeorm/migrations/*.js"],
    "cli": {
      "migrationsDir": "./dist/shared/infra/typeorm/migrations/"
    }
  },
  {
    "name": "mongo",
    "type": "mongodb",
    "host": process.env.MONGO_HOST,
    "port": process.env.MONGO_PORT,
    "database": process.env.MONGO_DATABASE,
    "useUnifiedTopology": true,
    "entities": ["./dist/modules/**/infra/typeorm/schemas/*.js"]
  }
]
