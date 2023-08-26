import 'package:flutter/material.dart';
import 'package:st_credit/pages/AnalysisDone.dart';
import 'package:st_credit/pages/analystRequests.dart';

import 'initialPage.dart';

class ClientInfo extends StatefulWidget{
  @override
  _ClientInfoState createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Análise",
            style: TextStyle(color: Colors.black))),
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SOLICITANTE", style: TextStyle(color: Color(0xff0E2F71))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nome", style: TextStyle(color: Color(0xff979797)),),
                  Text("Carla", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sobrenome", style: TextStyle(color: Color(0xff979797)),),
                  Text("Marques", style: TextStyle(color: Color(0xff414141)),)
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("INFORMAÇÕES PESSOAIS", style: TextStyle(color: Color(0xff0E2F71))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Idade", style: TextStyle(color: Color(0xff979797)),),
                  Text("25 anos", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Estado Civil", style: TextStyle(color: Color(0xff979797)),),
                  Text("casada", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nível de educação", style: TextStyle(color: Color(0xff979797)),),
                  Text("Superior", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filhos", style: TextStyle(color: Color(0xff979797)),),
                  Text("0", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("INFORMAÇÕES DE POSSES", style: TextStyle(color: Color(0xff0E2F71))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Possui carro?", style: TextStyle(color: Color(0xff979797)),),
                  Text("sim", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Possui propriedades?", style: TextStyle(color: Color(0xff979797)),),
                  Text("sim", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Modo de viver", style: TextStyle(color: Color(0xff979797)),),
                  Text("-", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("INFORMAÇÕES FINANCEIRAS", style: TextStyle(color: Color(0xff0E2F71))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categoria de renda", style: TextStyle(color: Color(0xff979797)),),
                  Text("-", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rendimento anual", style: TextStyle(color: Color(0xff979797)),),
                  Text("-", style: TextStyle(color: Color(0xff414141)),)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Empréstimo", style: TextStyle(color: Color(0xff979797)),),
                  Text("-", style: TextStyle(color: Color(0xff414141)),)
                ],
              )
            ],
          ),
          const SizedBox(height: 50),
          Container(
            height: 45.0,
            width: 430.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 57, 115, 240),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0,
                    )),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnalysisDone()));
                },
                child: const Text('Realizar Análise')
            ),
          )
        ],
      ),) 
    );
  }
}