import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference clientsCollection =
      FirebaseFirestore.instance.collection('clients');

  Future<List<Map<String, dynamic>>> getUsers() async {
    List<Map<String, dynamic>> usersList = [];

    try {
      QuerySnapshot querySnapshot = await usersCollection.get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic>? userData = doc.data() as Map<String, dynamic>?;
        if (userData != null) {
          usersList.add(userData);
        }
      });

      return usersList;
    } catch (e) {
      print('Erro ao obter usuários: $e');
      return usersList;
    }
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: email).get();
      if (querySnapshot.size > 0) {
        DocumentSnapshot docSnapshot = querySnapshot.docs[0];
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        print('Usuário não encontrado.');
        return null;
      }
    } catch (e) {
      print('Erro ao obter usuário: $e');
      return null;
    }
  }

  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      await usersCollection.add(userData);
      print('Usuário adicionado com sucesso!');
    } catch (e) {
      print('Erro ao adicionar usuário: $e');
    }
  }

  Future<void> addClient(Map<String, dynamic> userData) async {
    try {
      await clientsCollection.add(userData);
      print('Cliente cadastrado com sucesso!');
    } catch (e) {
      print('Erro ao cadastrar cliente: $e');
    }
  }
}
