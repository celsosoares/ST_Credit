import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../firebase/firebase_auth.dart';
import 'homeUser.dart';

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  String nomeUsuario = '';
  String emailUsuario = '';
  int _currentIndex = 0;

  final List<FAQItem> faqList = [
    FAQItem(
        question: 'Como faço para solicitar um empréstimo?',
        answer:
            'No seu perfil de cliente, vá para a seção "Solicitar Empréstimo" e preencha o formulário de solicitação.'),
    FAQItem(
        question: 'Quanto tempo leva para obter a análise de crédito?',
        answer:
            'Geralmente, nossa equipe de analistas de crédito leva de 1 a 2 dias úteis para concluir a análise.'),
  ];
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'FAQ',
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
                      HomeUser(email: emailUsuario, nome: nomeUsuario)),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqList[index].question),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faqList[index].answer),
              ),
            ],
          );
        },
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
                      HomeUser(email: emailUsuario, nome: nomeUsuario)),
            );
          } else {
            authService.logoutAndNavigateToHome(context,true, false);
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
