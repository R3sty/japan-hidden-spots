const { Pool } = require("pg");
const path = require("path");

require("dotenv").config({
  path: path.resolve(__dirname, "../../.env"),
});

/*
__dirname points to the directory containing pool.js (server/db).
../../ goes up two levels to the project root.
dotenv now loads the correct .env regardless of where you run the server.
*/

const pool = new Pool({
  connectionString: process.env.DATABASE_URL_POOLED,
});

module.exports = pool; //This allows other backend files to import and reuse the same pool.

/*
connectionString: Tells PostgreSQL where to connect.

process.env.DATABASE_URL_POOLED: Retrieves your pooled Neon connection string.

*/
