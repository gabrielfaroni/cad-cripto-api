
const service = require('../services/criptoService')

//exports.adiconarMoeda = (req, res) => {



//exports.alterarMoeda = (req, res) => {



exports.obterMoeda = (req, res) => {
    
    res.status(201).send(service.obterMoedaService())

}

//exports.deletarMoeda = (req, res) => {
    
