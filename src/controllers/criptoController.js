const service = require('../services/criptoService')

// exports.adiconarMoeda = (req, res) => {

// }

// exports.alterarMoeda = (req, res) => {

// }

exports.obterMoedas = (req, res) => {
    res.status(201).send(service.obterMoedasService());
}

exports.obterMoedaPeloId = (req, res) => {
    let id = parseInt(req.query.id);                      // como aqui é query.id lá tem que ser id. se fosse. if teria q user if. No back usamos o query, ai tem o "?" no postman
    let moeda = service.obterMoedaPeloIdService(id)
    res.status(201).send(moeda);
}

// exports.deletarMoeda = (req, res) => {

// }