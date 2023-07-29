import 'dart:io';

import 'package:st_credit/pages/homeUser.dart';
import 'package:st_credit/pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:st_credit/firebase/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _passVis = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService authService = AuthService();

  Widget _buildTextEmail() {
    return TextFormField(
      controller: _emailController, // Vincule o controlador ao campo de e-mail.
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle:
            TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 20),
      ),
    );
  }

  Widget _buildTextPass() {
    return TextFormField(
      controller:
          _passwordController, // Vincule o controlador ao campo de senha.
      decoration: InputDecoration(
        hintText: "Senha",
        hintStyle: TextStyle(
          color: Color.fromRGBO(30, 30, 30, 100),
          fontSize: 20,
        ),
        suffixIcon: IconButton(
          icon: _passVis ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _passVis = !_passVis;
            });
          },
        ),
      ),
      autofocus: true,
      keyboardType: TextInputType.text,
      obscureText: _passVis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(35),
          child: Center(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Acesse sua conta.',
                  style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 35),
              Divider(),
              Container(
                child: Column(
                  children: <Widget>[
                    _buildTextEmail(),
                    SizedBox(height: 20.0),
                    _buildTextPass(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      // TODO: Navegar para a página de recuperação de senha
                    },
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 123, 128, 136),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Container(
                height: 50.0,
                width: 430.0,
                child: ElevatedButton(
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 57, 115, 240),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    // Altere o tipo da variável loginSuccessful para User?.
                    User? user = await authService.signInWithEmailAndPassword(
                        email, password);

                    if (user != null) {
                      // O login foi bem-sucedido e o objeto User está disponível.
                      // Faça o que precisa ser feito após o login bem-sucedido, como navegar para a tela HomeUser.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeUser()),
                      );
                    } else {
                      // O login falhou, exiba uma mensagem de erro.
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Erro de Login'),
                            content:
                                Text('Credenciais inválidas. Tente novamente.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 50),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 5, 5),
                      ),
                      text: "Não tem uma conta? ",
                    ),
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      text: "Registre-se!",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                    ),
                  ],
                ),
              ),
            ])),
          ),
        ));
  }
}
