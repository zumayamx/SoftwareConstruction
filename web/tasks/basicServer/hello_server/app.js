"use strict"
import express from 'express';

const app = express();
let cards = [];

app.use(express.json());

app.get("/name", (req, res) => {
    const salute = "Hello from server";
    res.status(200).send(salute);
});

const PORT = process.env.PORT ?? 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

app.get("/hello/:name", (req, res) => {
    console.log(req.params);
    const salute = `Hello ${req.params.name}`;
    res .status(200).send(salute);
})

app.post("/cards", (req, res) => {
    console.log(req.body);
    cards.push(req.body);
    res.status(200).send('Card added');
})
