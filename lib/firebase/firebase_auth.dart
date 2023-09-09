import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:st_credit/pages/auth/signinPage.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Deslogar
  Future<void> logoutAndNavigateToHome(BuildContext context, bool isUser, bool isAnalyst) async {
    try {
      await FirebaseAuth.instance.signOut();
      if(isUser){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignInPage(isUser: true,isAnalyst: false)), // Tela inicial do seu aplicativo
              (route) => false, // Remove todas as rotas anteriores da pilha
        );
      }else{
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignInPage(isUser: false,isAnalyst: true)), // Tela inicial do seu aplicativo
              (route) => false, // Remove todas as rotas anteriores da pilha
        );
      }

    } catch (e) {
      print('Erro ao realizar logout: $e');
    }
  }
}