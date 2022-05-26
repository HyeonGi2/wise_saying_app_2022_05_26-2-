import express from "express";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: "localhost",
  user: "sbsst",
  password: "sbs123414",
  database: "exam1",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  dateStrings: true,
});

const app = express();
app.use(express.json());
const port = 3000;

app.get("/exam1/random", async (req, res) => {
  const { id } = req.params;
  const [[wiseSayingRow]] = await pool.query(
    `
     SELECT *
     FROM exam1
     WHERE BY RAND()
     LIMIT 1
     `, 
     [id,]
     );

  const (wiseSayingRow == undefined) {
    res.status(404).json({
      resultCode: "F-1",
      msg: "404 not found",
    });
    return;
  }

  res.json({
    resultCode: "S-1",
  msg: "성공",
  data: wiseSayingRow,
  });
});

app.patch("/wise-sayings/:id", async (req, res) => {
  const { id } = req.params;

  const { author, content } = req.body;

  const [rows] = await pool.query("SELECT * FROM wise_saying WHERE id = ?", [
    id,
  ]);

  if (rows.length == 0) {
    res.status(404).send("not found");
    return;
  }

  if (!author) {
    res.status(400).json({
      msg: "author required",
    });
    return;
  }

  if (!content) {
    res.status(400).json({
      msg: "content required",
    });
    return;
  }

  const [rs] = await pool.query(
    `
    UPDATE wise_saying
    SET content = ?,
    author = ?
    WHERE id = ?
    `,
    [content, author, id]
  );

  res.status(200).json({
    id,
    author,
    content,
  });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});