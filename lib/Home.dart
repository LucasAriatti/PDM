import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Jogador nos = Jogador(0, 0);
  Jogador eles = Jogador(0, 0);



  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
       //   Image.asset('images/fundo.jpg',
    //fit: BoxFit.cover,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [


            Padding(
              padding: EdgeInsets.all(200.0),
              child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text("Nos" ,style: TextStyle(
                  color: Colors.white,
                  
                ),),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
              child: ElevatedButton(onPressed: (){
                 SetPontuacoes("n1");
                 

              },  child: Text("+1",style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  
                ),)),
              ),
              ElevatedButton(onPressed: (){
               SetPontuacoes("-n1");
              

              }, child: Text("-1",style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  
                ),))

            ]
          ),

          Row( //Linha do boao Truco
            children: <Widget>[
            Column(
              children: [ 
               ElevatedButton(onPressed: (){
                SetPontuacoes("ntruco" );

               }, child: Text("Truco",style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  
                ),))
              ],
            )

            ],
          ),
        Row(
          children: [
            Column(children: [
              Text("Pontacao Atual: $pontosNos",style: TextStyle(
                  color: Colors.white,
                  
                ),)
            ],)
          ],
        ),
        Row(
          children: [
            
            Column(
              children: [
                Text("Partidas Ganhas: $ganhosNos",style: TextStyle(
                  color: Colors.white,
                  
                ),)
              ],
            )
          ],
        )
          ])),


//--------------------------------------------- DIVISAO DE COLUNAS NOS E ELES-------------------------------------------
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : <Widget>[
            Text("Eles"),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(onPressed: (){
                    SetPontuacoes("e1");
                  }, child: Text("+1",style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  
                ),))
              )],

              ),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    SetPontuacoes("-e1");
                  }, child: Text("-1",style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  
                ),))
                ],
              ),
              
            ],
          ),
          Row(
                children: [
                  Column(
                    children: [
                      ElevatedButton(onPressed: (){
                        SetPontuacoes("etruco");
                      }, child: Text("Truco",style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  
                ),))
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Pontuacao Atual: $pontosEles")
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Partidas Ganhas: $ganhosEles ")
                    ],
                  )
                ],
              )

          ]),
          
          ],
        )
        
        
        ],
    );
  }

int pontosNos = 0, ganhosNos = 0;
int pontosEles = 0, ganhosEles = 0;

SetPontuacoes(String n) {
  setState(() {
    
switch (n) {
  case "n1":
    nos.editarPontuacao(1);
    pontosNos = nos.getpontuacaoAtual();
    break;
    case "-n1":
    if(nos.pontuacaoAtual<=0){
      break;
    }
    nos.editarPontuacao(-1);
    pontosNos = nos.getpontuacaoAtual();
    break;
    case "ntruco":
    nos.editarPontuacao(3);
    pontosNos = nos.getpontuacaoAtual();
    break;
  //-------------------------------
  case "e1":
    eles.editarPontuacao(1);
    pontosEles = eles.getpontuacaoAtual();
    break;
    case "-e1":
    if(eles.pontuacaoAtual<=0){
      break;
    }
    eles.editarPontuacao(-1);
    pontosEles= eles.getpontuacaoAtual();
    break;
    case "etruco":
    eles.editarPontuacao(3);
    pontosEles = eles.getpontuacaoAtual();
    break;

  default: break;
}




if(nos.getpontuacaoAtual()>=13){
nos.editarPartidas(1);
ganhosNos = nos.getGanhos();
nos.zerarPontos();
eles.zerarPontos();
pontosEles = 0;
pontosNos = 0;
}

if(eles.getpontuacaoAtual()>=13){
eles.editarPartidas(1);
ganhosEles = eles.getGanhos();
nos.zerarPontos();
eles.zerarPontos();
pontosEles = 0;
pontosNos = 0;


}




  });
  }



}

class Jogador {

int pontuacaoAtual = 0;
int partidasGanhas = 0;

Jogador(this.pontuacaoAtual, this.partidasGanhas);

void editarPontuacao(int p){
pontuacaoAtual += p;
  }

void editarPartidas(int pg){
  partidasGanhas += pg;
  }

getpontuacaoAtual(){
  return pontuacaoAtual;
}

getGanhos(){
  return partidasGanhas;
}

zerarPontos(){
  pontuacaoAtual = 0;
}



}
