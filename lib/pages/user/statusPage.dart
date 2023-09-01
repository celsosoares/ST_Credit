import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../firebase/firebase_auth.dart';
import 'homeUser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatusPage extends StatefulWidget {

  final String email;
  final String nome;
  StatusPage({required this.email, required this.nome});
  @override
  State<StatusPage> createState() => _StatusState();
}

class _StatusState extends State<StatusPage> {
  int _currentIndex = 0;
  bool isAprovado = false;
  double len = 200;
  AuthService authService = AuthService();

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeUser(email: widget.email, nome: widget.nome)),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 4),
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
                          const SizedBox(height: 15),
                          Container(
                            width: 300,
                            child: const Text(
                              'A análise leva em conta vários fatores e nesse momento não conseguimos liberar um cartão de crédito para você. Faça um novo pedido daqui há 3 dias.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 55),
                            ),
                            autofocus: false,
                            onPressed: () {},
                            child: const Text("Solicitar Reanálise"),
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
          });
          if (_currentIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeUser(email: widget.email, nome: widget.nome)),
            );
          }else{
            authService.logoutAndNavigateToHome(context);
          }
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Página Inicial'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.doorOpen), label: 'Sair')
        ],
      ),
    );
  }
}
