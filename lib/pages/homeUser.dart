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
            height: 266,
            color: Color(0xFF2A64D9),
            child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Bem vinda,',
                          style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                        ))
                      ,
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Carla M.",
                          style: TextStyle(fontSize: 28, color: Color(0xFFFFFFFF)),
                        ),
                      )
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

}