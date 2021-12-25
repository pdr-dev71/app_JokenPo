// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo",

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do usuario: " + escolhaUsuario);

    switch ( escolhaApp ) {
      case "pedra":
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
          setState(() {
            this._imageApp = AssetImage("images/papel.png");
          });
        break;
      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    //Usuario ganha
    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra") 
    ) {
      setState(() {
        this._mensagem = "Parabéns!! Você ganhou :)";
      });
    //App ganha
    }else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "papel")
    ){
      setState(() {
        this._mensagem = "Voce perdeu :/";
      });
    }else{
       setState(() {
        this._mensagem = "Empatamos";
      });
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 31, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(image: this._imageApp),
            Padding(
              padding: EdgeInsets.only(top: 31, bottom: 16),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
