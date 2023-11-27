var database = require("../database/config")



function cadastrar(nome, email, senha, fkTitulo) {
    var instrucao = `
        INSERT INTO usuario (nickname, email, senha, fkTitulo) VALUES
         ('${nome}', '${email}' , '${senha}', ${fkTitulo});`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT idUser, nickname, email FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function update(fkItem, fkLocal, fkPersonagem, sessionUser) {
    var instrucao = `
    update usuario set fkItem = ${fkItem}, fkLocal = ${fkLocal}, fkPersonagem = ${fkPersonagem}
        where idUser = ${sessionUser};`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function pegar(){
    var instrucao = `
    select count(u.fkTitulo) as count, t.titulo from usuario as u join titulo as t on u.fkTitulo = t.idTitulo group by t.titulo;
    `
    return database.executar(instrucao);
}



module.exports = {
    cadastrar,
    autenticar,
    update,
    pegar
};