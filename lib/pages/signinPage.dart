import 'package:st_credit/pages/homeUser.dart';
import 'package:st_credit/pages/initialPage.dart';
import 'package:st_credit/pages/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
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
      controller: _emailController,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
        labelStyle:
            TextStyle(color: Color.fromRGBO(30, 30, 30, 100), fontSize: 20),
      ),
    );
  }

  Widget _buildTextPass() {
    return TextFormField(
      controller:
          _passwordController,
      decoration: InputDecoration(
        hintText: "Senha",
        hintStyle: const TextStyle(
          color: Color.fromRGBO(30, 30, 30, 100),
          fontSize: 20,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          leading:  IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        InitialPage())),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(35),
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
              const SizedBox(height: 35),
              const Divider(),
              Container(
                child: Column(
                  children: <Widget>[
                    _buildTextEmail(),
                    SizedBox(height: 20.0),
                    _buildTextPass(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      // TODO: Navegar para a página de recuperação de senha
                    },
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 123, 128, 136),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
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
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    User? user = await authService.signInWithEmailAndPassword(
                        email, password);

                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeUser(email: email, nome: "Nome do Usuário"),
                        ),
                      );
                    } else {
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
                    child: const Text('Entrar')
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
                      text: "Não tem uma conta? ",
                    ),
                    TextSpan(
                      style: const TextStyle(
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
