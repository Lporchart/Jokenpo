import 'dart:math';
import 'package:flutter/material.dart';

class jogo extends StatefulWidget {
  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  
  var imageApp = AssetImage("images/padrao.png");
  var texto = "Sua Escolha";
  void opcaoSelecionada(String escolhauser){
    var opcao = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaapp = opcao[numero];

    switch (escolhaapp) {
      case "pedra":
        setState(() {
          imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          imageApp = AssetImage("images/tesoura.png");
        });
        break;        
      
    }
    if (
        (escolhauser == "pedra" && escolhaapp == "tesoura") ||
        (escolhauser == "tesoura" && escolhaapp == "papel") ||
        (escolhauser == "papel" && escolhaapp == "pedra")
        ){
        setState(() {
          this.texto = "parabens vc ganhou";
        });

    } else if (
        (escolhaapp == "pedra" && escolhauser == "tesoura") ||
        (escolhaapp == "tesoura" && escolhauser == "papel") ||
        (escolhaapp == "papel" && escolhauser == "pedra")
        ){
        setState(() {
          this.texto = "vc perdeu";
        });
    }else{
        setState(() {
          this.texto = "Empatou";
        });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Text("jokenpo"),
      centerTitle: true,
      backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.center ,
        children: <Widget>[
           Padding(padding: EdgeInsets.only(top: 40, bottom: 16),
             child: Text(
               "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle:FontStyle.italic,
                  color: Colors.black,
                ),
            ),
          ),
          Image(image: this.imageApp,),
          Padding(padding: EdgeInsets.only(top: 40, bottom: 16),
             child: Text(
                this.texto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle:FontStyle.italic,
                  color: Colors.black,
                ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
              onTap: () => opcaoSelecionada("pedra"),
              child: Image.asset("images/pedra.png",height: 90,)                
              ),
              GestureDetector(
              onTap: () => opcaoSelecionada("papel"),
              child:Image.asset("images/papel.png",height: 90,)              
              ),
              GestureDetector(
              onTap: () => opcaoSelecionada("tesoura"),
              child: Image.asset("images/tesoura.png",height: 90,)
         
              ),
    
        ],),
        ],
      ),
    );
  }
}
