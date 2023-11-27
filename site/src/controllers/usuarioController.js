var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        if (resultadoAutenticar.length > 0) {
                            res.json({
                                id: resultadoAutenticar[0].idUser,
                                email: resultadoAutenticar[0].email,
                                nickname: resultadoAutenticar[0].nickname,
                                senha: resultadoAutenticar[0].senha,
                            });
                        } else {
                            res.status(204).json({ aquarios: [] });
                        }

                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}



function cadastrar(req, res) {
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var fkTitulo = req.body.selectServer;

    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }

    usuarioModel.cadastrar(nome, email, senha, fkTitulo).then(function (resposta) {
        res.status(200).send("Usuario cadastrado com sucesso");
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function update(req, res) {
    var fkItem = req.body.selectServerItem;
    var fkLocal = req.body.selectServerLocal;
    var fkPersonagem = req.body.selectServerPersonagem;
    var sessionUser = req.body.userServer;

    usuarioModel.update(fkItem, fkLocal, fkPersonagem, sessionUser).then(function (resposta) {
        res.status(200).send("O inventario foi cadastrado com sucesso");
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function pegar(req, res){
    usuarioModel.pegar()
        .then(
            function(pegar){
                console.log(`Resultado: ${JSON.stringify(resultadoGrafico)}`);

                if(pegar.length > 0){
                    console.log(resultadoGrafico);
                    res.status(200).json(resultadoGrafico);
                }else {
                    res.status(404).send("A lista está vazia")
                }
            }
            
        )
}

module.exports = {
    autenticar,
    cadastrar,
    update,
    pegar
}
