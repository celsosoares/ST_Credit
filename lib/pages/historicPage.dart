import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeUser.dart';

class HistoricPage extends StatefulWidget {
  @override
  State<HistoricPage> createState() => _HistoricoState();
}

class _HistoricoState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserHistory(),
    );
  }
}

class UserHistory extends StatefulWidget {
  @override
  State<UserHistory> createState() => _StatusState();
}

class _StatusState extends State<UserHistory> {
  int _currentIndex = 0;
  List<String> datas = [
    '2023-06-25',
    '2023-07-20',
    '2023-08-15',
  ];
  bool isAprovado = false; // vai receber dentro da lista

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Histórico de análises',
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
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (context, index) {
                    String date = datas[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 235, 232, 232)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(1, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(date, style: TextStyle(fontSize: 18)),
                            Text(
                              isAprovado ? 'Aprovado' : 'Negado',
                              style: GoogleFonts.urbanist(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2A64D9))),
                            )
                          ],
                        ),
                      ),
                    );
                  },
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
