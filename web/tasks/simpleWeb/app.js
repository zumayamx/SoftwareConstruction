import express from 'express';
import fs from 'fs';
const app = express();
app.use(express.static("public"));
app.use(express.json());

app.get('/web', (req, res)=> {
    const file = fs.readFileSync("public/html/index.html", "utf-8");
    res.status(200).send(file);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});