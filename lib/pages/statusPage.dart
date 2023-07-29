import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeUser.dart';

class StatusPage extends StatefulWidget {
  @override
  State<StatusPage> createState() => _StatusState();
}

class _StatusState extends State<StatusPage> {
  int _currentIndex = 0;
  bool isAprovado = false;
  double len = 200;

  @override
  Widget build(BuildContext context) {
    if (isAprovado == false) {
      len = 60;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Status',
          style: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeUser(email: "email", nome: "Nome do Usuário")),
            );
            // Voltar à tela anterior
          },
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: len),
              Center(
                child: isAprovado
                    ? Image.asset(
                        'assets/images/telastatus.png',
                        width: 200,
                        height: 200,
                      )
                    : Image.asset(
                        'assets/images/telastatus2.png',
                        width: 200,
                        height: 200,
                      ),
              ),
              SizedBox(height: 20),
              Text(
                'A solicitação de cartão foi',
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.center,
                child: isAprovado
                    ? Text(
                        'APROVADO!',
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            'NEGADO!',
                            style: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 300,
                            child: Text(
                              'A análise leva em conta vários fatores e nesse momento não conseguimos liberar um cartão de crédito para você. Faça um novo pedido daqui há 3 dias.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 55),
                            ),
                            autofocus: false,
                            onPressed: () {},
                            child: Text("Solicitar Reanálise"),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomeUser(email: "email", nome: "Nome do Usuário")),
              );
            }
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Página Inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
