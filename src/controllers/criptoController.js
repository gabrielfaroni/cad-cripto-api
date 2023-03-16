const sql = require('../../bin/conexaoBd'); // toda vez que eu trabalhar com arquivo fora, tenho que chamar aqui com require

// exports.adiconarMoeda = (req, res) => {

// }

exports.alterarMoeda = (req, res) => {

  var preco = req.body.preco
  var descricao = req.body.descricao
  let id = parseInt(req.body.id);

  var query = `UPDATE moedas SET PRECO_COMPRA_VENDA=${preco}, DESCRICAO="${descricao}" WHERE ID_MOEDA = ${id}`  // esse código vem do mysql, update. 
  // isso é para alterar no banco, usando o node msm, aí vamos no postman testar e colocams por exemplo 
  /* //	{
      
      "preco": 10,
    "descricao": "testeççç",
    "id": 2
  
  } */


  return sql.execSQLQuery(query, res)



}

exports.obterMoedas = (req, res) => {
  return sql.execSQLQuery("SELECT *FROM MOEDAS", res) // aqui pegamos do banco moedas, podiamos pegar paridades se quiser também e assim vai
  //res.status(201).send(service.obterMoedasService());
};

exports.obterMoedaPeloId = (req, res) => {
  let id = parseInt(req.query.id); // como aqui é query.id lá tem que ser id. se fosse. if teria q user if. No back usamos o query, ai tem o "?" no postman
  // esse id é atributo de moeda
  var query =
    `SELECT
moedas.NOME AS 'Nome Moeda',
moedas.PRECO_COMPRA_VENDA AS 'PREÇO',
moedas.DESCRICAO AS 'Descrição',
paridades.nome AS 'Paridade'
FROM 
moedas
INNER JOIN moedas_has_paridades
ON 
moedas.ID_MOEDA = moedas_has_paridades.MOEDAS_ID_MOEDA
INNER JOIN paridades
ON
paridades.ID_PARIDADE = moedas_has_paridades.PARIDADES_ID_PARIDADE
WHERE moedas.ID_MOEDA = ${id}`
  return sql.execSQLQuery(query, res)

};

// exports.deletarMoeda = (req, res) => {

// }
