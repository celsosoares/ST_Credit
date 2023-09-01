import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:st_credit/pages/auth/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:uuid/uuid.dart';

import '../../firebase/firebase_auth.dart';
import '../../firebase/firebase_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseService firebaseService = FirebaseService();
  FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController _nomeCompletoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

  String dropdownValue = 'Tipo de Perfil';
  bool _passVis = true;
  AuthService authService = AuthService();

  final TextEditingController _senha = TextEditingController();
  final TextEditingController _confirmarsenha = TextEditingController();

  Widget _buildTextName() {
    return TextFormField(
      controller: _nomeCompletoController,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          labelText: "Nome Completo",
          labelStyle:
              TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15)),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "O nome é obrigatório";
        } else if (value != null && value.length > 18) {
          return "O nome pode ter no máximo 18 caracteres";
        }
        return null;
      },
    );
  }

  Widget _buildTextEmail() {
    return TextFormField(
      controller: _emailController,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email",
          labelStyle:
              TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15)),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "O email é obrigatório";
        } else if (value != null &&
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return "Insira um email valido";
        }
        return null;
      },
    );
  }

  Widget _buildProfileOption() {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        autofocus: true,
        value: dropdownValue,
        items: <String>[
          'Tipo de Perfil',
          'Analista',
          'Cliente',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                  color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
      ),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _senhaController,
      decoration: InputDecoration(
        hintText: "Senha",
        hintStyle: const TextStyle(
          color: Color.fromRGBO(30, 30, 30, 100),
        ),
        suffixIcon: IconButton(
          icon: _passVis ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
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

  Widget _buildRewritePassword() {
    return TextFormField(
      controller: _confirmarSenhaController,
      autofocus: true,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: const InputDecoration(
          labelText: "Confirmar Senha",
          labelStyle:
              TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 15)),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Reinsira a senha";
        } else if (_senha.text != _confirmarsenha.text) {
          return "A confirmação de senha não confere";
        }
        return null;
      },
    );
  }

  void sendData(nome, email, perfil) async {
    String id = Uuid().v4();
    Map<String, dynamic> userData = {
      'id': id,
      'nome': nome,
      'email': email,
      'perfil': perfil,
    };

    await firebaseService.addUser(userData);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text(
            "Cadastro",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(35),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Divider(),
                      _buildTextName(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildTextEmail(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildProfileOption(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildPassword(),
                      const SizedBox(height: 10),
                      _buildRewritePassword(),
                      const SizedBox(height: 30),
                      Container(
                        height: 50.0,
                        width: 430.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 57, 115, 240),
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            String nomeCompleto =
                                _nomeCompletoController.text.trim();
                            String email = _emailController.text.trim();
                            String senha = _senhaController.text.trim();
                            String perfil = dropdownValue;

                            sendData(nomeCompleto, email, perfil);

                            User? user = await authService
                                .registerWithEmailAndPassword(email, senha);

                            if (user != null) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Registro bem-sucedido'),
                                    content: const Text(
                                        'Seu registro foi concluído com sucesso!'),
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
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Erro de Registro'),
                                    content: Text(
                                        'O registro falhou. Tente novamente mais tarde.'),
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
                            child: const Text('Cadastrar')
                        ),
                      ),
                      const SizedBox(height: 50),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              style: TextStyle(
                                color: Color.fromARGB(255, 5, 5, 5),
                              ),
                              text: "Já tem uma conta? ",
                            ),
                            TextSpan(
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              text: "Login!",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()));
                                },
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
