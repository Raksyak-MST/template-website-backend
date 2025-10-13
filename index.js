const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
require("dotenv").config({path: ".env.local"});

const app = express()
const DEFAULT_PORT = 3000;
const allowedOrigin = (process.env.CORS_ORIGINS ?? "").split(",")
const port = (process.env.PORT ?? DEFAULT_PORT)

// Middleware
app.use(
  cors({
    origin(origin, callback) {
      if (!origin || allowedOrigin.includes(origin)) callback(null, true)
      else callback(new Error("Not allowed by CORS"))
    },
  }),
)

// Config
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
})

app.listen(port, () => console.log(`Started listening on port ${port}`));

// API
app.get("/health", (req, res) => {
  res.status(200).json({status: "OK", message: "Server is alive!"});
})
