const express = require("express");
const mysql = require("mysql2");

const app = express();

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "Template",
});

app.get("/sections/:hotelID/:templateID", async (req, res) => {
  console.log(req.originalUrl);
  connection.query("SELECT * FROM contents", (err, result) => {
    console.log(result);
    res.send("done");
  })
});

app.listen(8000, () =>
  console.log(
    `API service started on port 8000\n Connection to db : ${connection}`,
  ),
);
