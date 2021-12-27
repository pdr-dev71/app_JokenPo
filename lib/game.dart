import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageApp = AssetImage("images/padrao.png");
  var _message = "Escolha uma opção abaixo";

  void _optionsSelect(String userChoice) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var appChoice = options[number];

    print("Escolha do App: " + appChoice);
    print("Escolha do usuario: " + userChoice);

    //Exibição da imagem escolhida pelo App
    switch (appChoice) {
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

    //Validação do ganhador
    //Usuario Ganhador
    if ((userChoice == "pedra" && appChoice == "tesoura") ||
        (userChoice == "tesoura" && appChoice == "papel") ||
        (userChoice == "papel" && appChoice == "pedra")) {
      setState(() {
        this._message = "Parabéns!!! Você ganhou :)";
      });
      //App Ganhador
    } else if ((appChoice == "pedra" && userChoice == "tesoura") ||
        (appChoice == "tesoura" && userChoice == "papel") ||
        (appChoice == "papel" && userChoice == "pedra")) {
      setState(() {
        this._message = "Você perdeu :(";
      });
    } else {
      setState(() {
        this._message = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1) text
          //2) imagem
          //3) text resultado
          //4) Linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _optionsSelect("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _optionsSelect("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _optionsSelect("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
