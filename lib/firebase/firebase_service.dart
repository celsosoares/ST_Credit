import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // Função para obter todos os usuários da coleção "users"
  Future<List<Map<String, dynamic>>> getUsers() async {
    List<Map<String, dynamic>> usersList = [];

    try {
      QuerySnapshot querySnapshot = await usersCollection.get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic>? userData = doc.data() as Map<String,
            dynamic>?; // Conversão explícita para Map<String, dynamic>
        if (userData != null) {
          usersList.add(userData);
        }
      });

      return usersList;
    } catch (e) {
      print('Erro ao obter usuários: $e');
      return usersList; // Retorna uma lista vazia em caso de erro.
    }
  }

  // Função para adicionar um novo usuário na coleção "users"
  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      await usersCollection.add(userData);
      print('Usuário adicionado com sucesso!');
    } catch (e) {
      print('Erro ao adicionar usuário: $e');
    }
  }
}
