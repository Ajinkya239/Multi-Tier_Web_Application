const express = require('express');
const { Pool } = require('pg');
require('dotenv').config();

const app = express();
const port = 3000;

// Database connection
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

app.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.send(`Database connection successful! Current time: ${result.rows[0].now}`);
  } catch (err) {
    res.status(500).send('Error connecting to the database.');
  }
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});

