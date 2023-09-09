import 'package:flutter/material.dart';
import 'package:st_credit/firebase/firebase_service.dart';
import 'package:st_credit/pages/analyst/clientInfo.dart';
import 'package:st_credit/pages/analyst/homeAnalyst.dart';

class AllRequests extends StatefulWidget {
  @override
  _AllRequestsState createState() => _AllRequestsState();
}

class _AllRequestsState extends State<AllRequests> {
  final FirebaseService firebaseService = FirebaseService();
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredClients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Todos", style: TextStyle(color: Colors.black)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeAnalyst(isUser: false,isAnalyst: true)),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                filterClients(value);
              },
              decoration: InputDecoration(
                hintText: 'Pesquisar por nome',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: firebaseService.getAllClients(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Erro ao obter os clientes.'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text('Nenhum cliente em análise.'));
                } else {
                  // Filtrar os clientes com base no valor do TextField
                  List<Map<String, dynamic>> clients = snapshot.data!;
                  if (_searchController.text.isNotEmpty) {
                    clients = firebaseService.filterClientsByName(
                        clients, _searchController.text);
                  }

                  return ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      final client = clients[index];
                      return buildClientListItem(client);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterClients(String query) {
    setState(() {
      filteredClients = firebaseService.filterClientsByName(
        filteredClients,
        query,
      );
    });
  }

  Widget buildClientListItem(Map<String, dynamic> client) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                client['nome'],
                style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClientInfo(
                              email: client['email'],
                            )),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Acessar",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
