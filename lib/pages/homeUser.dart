import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeUser extends StatefulWidget {
  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
                height: 240,
                color: const Color(0xFF2A64D9),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ const Column(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Bem vinda,',
                            style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                          ))
                        ,
                         Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Carla M.",
                            style: TextStyle(fontSize: 28, color: Color(0xFFFFFFFF)),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(10), // Define o raio dos cantos
                    ),
                      child: const Center(child:
                       Text("CM", style: TextStyle(color: Color(0xFF2A64D9))))
                    )
                  ],
                ),
            )
        ],
      ),
    );
  }

}