const express = require("express");
const app = express();
const router = express.Router();
const mysql = require('mysql2');         //  quando instalamos, colocamos aqui para informar.


const index = require("./routes/index");
const criptoRouter = require("./routes/criptoRouter");

app.use(express.json());

app.use("/", index);

app.use("/api/cripto", criptoRouter);
module.exports = app;

// LEMBRANDO QUE A COMUNICAÇÃO DO BACK COM O FRONT É FEITA COM JSON NORMALMENTE, A PLATAFORMA FAZ A CONVERSÃO
