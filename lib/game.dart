// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
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
            GestureDetector(
                onTap: () => {print("Um clique na imagem")},
                onDoubleTap: () => {print("Dois cliques na imagem")},
                onLongPress: () => {print("Clique longo")},
                child: (Image.asset("images/padrao.png"))),
            Padding(
              padding: EdgeInsets.only(top: 31, bottom: 16),
              child: Text(
                "Escolha uma opção abaixo",
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
                Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
                Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
                Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
