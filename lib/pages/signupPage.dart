import 'dart:io';
import 'package:st_credit/pages/signinPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _senha = TextEditingController();
  TextEditingController _confirmarsenha =
      TextEditingController(); // PasswordValidation

  String dropdownValue = 'Tipo de Perfil';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text(
            "Cadastro",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Divider(),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Nome Completo",
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(30, 30, 30, 100),
                                fontSize: 15)),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "O nome é obrigatório";
                          } else if (value != null && value.length > 18) {
                            return "O nome pode ter no máximo 18 caracteres";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(30, 30, 30, 100),
                                fontSize: 15)),
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: DropdownButton<String>(
                          autofocus: true,
                          value: dropdownValue,
                          items: <String>[
                            'Tipo de Perfil',
                            'Poupador',
                            'Conservador',
                            'Gastador'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Color.fromRGBO(30, 30, 30, 100),
                                    fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _senha,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(30, 30, 30, 100),
                                fontSize: 15)),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "A senha é obrigatória";
                          } else if (value != null && value.length < 8) {
                            return "A senha precisa ter no mínimo 9 caracteres";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _confirmarsenha,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Confirmar Senha",
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(30, 30, 30, 100),
                                fontSize: 15)),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Reinsira a senha";
                          } else if (_senha.text != _confirmarsenha.text) {
                            return "A confirmação de senha não confere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 50.0,
                        width: 430.0,
                        child: ElevatedButton(
                          child: Text('Cadastrar'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 0, 0, 0),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            // TODO
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => "Ex: Next Page"));
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
                              text: "Já tem uma conta? ",
                            ),
                            TextSpan(
                              style: TextStyle(
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
          padding: EdgeInsets.all(50),
        ));
  }
}
