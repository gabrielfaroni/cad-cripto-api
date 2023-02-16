
exports.obterMoedas = () => {
    let moedas = [
    {
    nome:"bitcoin",
    paridade: ["Ethereum", "Tether", "BNB"],
    corretoras: ["Binance", "Cracken","vasco"],
    precoCompraVenda: 200000.00,
    UnidadeMonetariaCompraVenda: "BRL",
},
    {
    nome:"elacoin",
    paridade: ["bot", "flu", "fla"],
    corretoras: ["ok", "ela","ele"],
    precoCompraVenda: 300000.00,
    UnidadeMonetariaCompraVenda: "BRL", 
},
    {
    nome:"elecoin",
    paridade: ["EUA", "BR", "ARG"],
    corretoras: ["chile", "bol","uru"],
    precoCompraVenda: 500000.00,
    UnidadeMonetariaCompraVenda: "BRL", 
},
    {
    nome:"fulanocoin",
    paridade: ["colombia", "peru", "ven"],
    corretoras: ["equa", "catar","fy"],
    precoCompraVenda: 800000.00,
    UnidadeMonetariaCompraVenda: "BRL", 
},
    {
    nome:"fulanocoin",
    paridade: ["monyo", "mika", "shu"],
    corretoras: ["kus", "londer","lod"],
    precoCompraVenda: 700000.00,
    UnidadeMonetariaCompraVenda: "BRL" 
}
    ]
     return moedas;
     }