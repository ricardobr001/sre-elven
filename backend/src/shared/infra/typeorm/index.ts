import { createConnections } from 'typeorm';

console.log({ host: process.env.MONGO_URL })

createConnections();
