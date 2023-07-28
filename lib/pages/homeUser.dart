import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeUser extends StatefulWidget {
  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser>{
  int _currentIndex = 0;
  final List<Widget> _pages =[
    HomeUser(),
    HomeUser()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: const Color(0xFF2A64D9),
        child: Column(
          children: [
            Container(
              height: 240,
              color: const Color(0xFF2A64D9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Bem vinda,',
                          style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Carla M.",
                          style: TextStyle(fontSize: 28, color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "CM",
                        style: TextStyle(color: Color(0xFF2A64D9)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child:
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),)
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Serviços",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20,
                              fontWeight: FontWeight.w700)
                        ),
                        Container(
                          height: 80,
                          width: 350,
                            decoration:  BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 0.10
                                )
                            ),
                          child: ElevatedButton(
                            onPressed: (){

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF7F8F9)
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.add,color: Colors.red,),
                                Text("Solicitar análise de crédito"
                                  , style: TextStyle(
                                      color: Colors.black
                                  ),)
                              ],
                            ),
                          )
                        ),
                        Container(
                            height: 80,
                            width: 350,
                            decoration:  BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                  width: 0.10
                              )
                            ),
                            child: ElevatedButton(
                              onPressed: (){

                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF7F8F9)
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.add,color: Colors.red,),
                                  Text("Status da sua análise"
                                    , style: TextStyle(
                                        color: Colors.black
                                    ),)
                                ],
                              ),
                            )
                        ),
                        Container(
                            height: 80,
                            width: 350,
                            decoration:  BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 0.10
                                )
                            ),
                            child: ElevatedButton(
                              onPressed: (){

                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF7F8F9)
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.access_time_filled,color: Colors.red,),
                                  Text("Histórico de análises"
                                    , style: TextStyle(
                                        color: Colors.black
                                    ),)
                                ],
                              ),
                            )
                        ),
                        Container(
                            height: 80,
                            width: 350,
                            decoration:  BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 0.10
                                )
                            ),
                            child: ElevatedButton(
                              onPressed: (){

                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF7F8F9)
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.add,color: Colors.red,),
                                  Text("Perguntas frequentes"
                                    , style: TextStyle(
                                        color: Colors.black
                                    ),)
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Página Inicial'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
              label: 'Configurações')
        ],
      ),
    );
  }
}