import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

enum StatusScreen{
  landscape,
  portrait
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  String _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String opcaoUsuario){
    List<String> opcoes = ["pedra", "papel", "tesoura"];
    int num = Random().nextInt(3);
    String escolhaApp = opcoes[num];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    String vencedor = "";
    //Validação do vencedor
    if((opcaoUsuario == "pedra" && escolhaApp == "tesoura")
      || (opcaoUsuario == "tesoura" && escolhaApp == "papel")
      || (opcaoUsuario == "papel" && escolhaApp == "pedra")){
      vencedor = "Parabéns!!! você ganhou :)";
    }
    else if((escolhaApp == "pedra" && opcaoUsuario == "tesoura")
      || (escolhaApp == "tesoura" && opcaoUsuario == "papel")
      || (escolhaApp == "papel" && opcaoUsuario == "pedra")){
      vencedor = "Você perdeu :(";
    }
    else{
      vencedor = "Empatamos ;)";
    }
    setState(() {
      this._mensagem = vencedor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    StatusScreen status = StatusScreen.portrait;
    if(size.width < size.height){
      status = StatusScreen.portrait;
    }
    else if(size.width > size.height){
      status = StatusScreen.landscape;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: status == StatusScreen.portrait ?
        _screenPortrait() : _screenLandscape(),
    );
  }

  Widget _screenLandscape(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  "Escolha do App:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                child: Image(
                  image: _imagemApp,
                  fit: BoxFit.contain,
                ), 
              ), 
            ],
          ),
        ),               
        Expanded(
          flex: 4,
          child: Column(          
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  _mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("pedra"),
                      child: Image.asset(
                        "images/pedra.png",
                        fit: BoxFit.contain,
                        width: 100,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("papel"),
                      child: Image.asset(
                        "images/papel.png",
                        fit: BoxFit.contain,
                        width: 100,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("tesoura"),
                      child: Image.asset(
                        "images/tesoura.png",
                        fit: BoxFit.contain,
                        width: 100,
                      ),
                    ),
                  ],
                ) 
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _screenPortrait(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            "Escolha do App:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          child: Image(
            image: _imagemApp,
            fit: BoxFit.contain,
          ), 
        ),
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            _mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  fit: BoxFit.contain,
                  width: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  fit: BoxFit.contain,
                  width: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  fit: BoxFit.contain,
                  width: 100,
                ),
              ),
            ],
          ) 
        ),
      ],
    );
  }
}
