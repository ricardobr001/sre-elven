import { createConnections } from 'typeorm';

console.log({ host: process.env.POSTGRES_HOST })
console.log({ port: process.env.POSTGRES_PORT })
console.log({ username: process.env.POSTGRES_USERNAME })
console.log({ password: process.env.POSTGRES_PASSWORD })
console.log({ database: process.env.POSTGRES_DATABASE })

createConnections();
