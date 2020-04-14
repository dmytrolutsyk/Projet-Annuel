// This file will instantiate a new and separate Express app for each test
// and rely on an in-memory MongoDB database.
// => The API server and MongoDB should not be running.

const express = require('express');
const { MongoClient } = require('mongodb');
const { MongoDBServer } = require('mongomem');
const initApiEndpoints = require('../app');

module.exports = ({ test }) => {
  const DB_NAME = 'notes-api';
  const PORT = process.env.PORT || 3000;

  const getPortAndDbName = (() => {
    let number = 0;
    return () => {
      number += 1;
      return ({
        port: PORT + number,
        dbName: `${DB_NAME}-${number}`,
      });
    };
  })();

  let dbClient; // the same database client will be used for all tests

  test.before('global setup', async () => {
  // MongoDBServer.debug = true;
    await MongoDBServer.start();
    const MONGODB_URI = await MongoDBServer.getConnectionString();

    // Connecting to in-memory MongoDB server
    dbClient = new MongoClient(MONGODB_URI, { useNewUrlParser: true });
    await dbClient.connect();
  });

  test.after.always('global cleanup', async () => {
    if (dbClient) dbClient.close();
    MongoDBServer.tearDown(); // Cleans up temporary file storage
  });

  test.beforeEach('per-test setup', async (t) => {
    const { port, dbName } = getPortAndDbName();
    const app = express();
    initApiEndpoints({ attachTo: app, db: dbClient.db(dbName), log: () => {} });
    // Each test will have its own database and API server
    t.context.urlPrefix = `http://localhost:${port}`; // eslint-disable-line no-param-reassign
    t.context.server = await app.listen(port); // eslint-disable-line no-param-reassign
  });

  test.afterEach.always('per-test cleanup', async (t) => {
    if (t.context.server) await t.context.server.close();
  });
};
