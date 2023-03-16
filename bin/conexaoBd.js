const mysql = require('mysql2');
exports.execSQLQuery = (sqlQry, res) => {             //exec.SQLquery é nome da função
    const connection = mysql.createConnection({
        host: 'localhost',
        port: '3306',
        user: 'root',
        password: '',
        database: 'basemoedas'
    });

    connection.query(sqlQry, (error, results, fields) => {   // função query, que tem como parametros padrões error, results e fields, nessa ordem vai saber se da erro e tal.
        // ai pegamos o parametro sqlQry que criamos la em exports.
        // fields se quiser saber os campos do banco, mas nesse caso não estamos usando.
        if (error)
            res.json(error);
        else
            res.json(results);
        connection.end();
        console.log('executou!');
    });
}

