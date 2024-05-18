"use strict"
import express from "express"
import fs from "fs";
const app = express();

app.get('/web', (req, res) => {
    const file = fs.readFileSync("index.html", "utf-8");
    res.status(200).send(file);
})

const PORT = process.env.port ?? 3000;
app.listen(PORT, () => {
    console.log(`Running on port ${PORT}`)
})