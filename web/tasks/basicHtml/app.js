/* José Manuel García Zumaya - A01784238*/
/* 27 - 04 - 2024 */
/* Basic HTML implementation */

"use strict"
import express from "express"
import fs from "fs";
const app = express();
app.use(express.static("public"));

app.get('/web', (req, res) => {
    const file = fs.readFileSync("public/html/index.html", "utf-8");
    res.status(200).send(file);
})

const PORT = process.env.port ?? 3000;
app.listen(PORT, () => {
    console.log(`Running on port ${PORT}`)
})