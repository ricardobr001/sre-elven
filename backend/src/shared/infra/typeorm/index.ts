import { createConnections } from 'typeorm';

console.log({ host: process.env.MONGO_URL })

console.log({ host: process.env.MONGO_HOST })
console.log({ port: process.env.MONGO_PORT })
console.log({ username: process.env.MONGO_USERNAME })
console.log({ password: process.env.MONGO_PASSWORD })
console.log({ database: process.env.MONGO_DATABASE })

createConnections().then(c => {
  console.log('CREATED CONNECTIONS');
  console.log(c);
  c[0].runMigrations({ transaction: 'all' })
    .then(a => console.log(a))
    .catch(e => console.log(e));
})
