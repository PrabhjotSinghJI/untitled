import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/exampl.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),() {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(), ),);

    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                AssetImage(
                    "images/W.jpg"
                ),
                fit: BoxFit.cover
            )
        ),
        child:  Center(
            child:
            Container(
              height: 650,

              child: const Text( " Welcome ",style: TextStyle(fontSize: 30,fontFamily: "SlacksideOne",color: Colors.black)
              ),
            )
        ),

      ),
    );
  }
}
