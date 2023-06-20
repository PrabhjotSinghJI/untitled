import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exampl.dart';

class Brand extends StatelessWidget {
  const Brand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: ListWheelScrollView(
        itemExtent: 200,
        children: [
          CupertinoButton(
              child: const Text("Sign Out"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) =>
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Login()))
                });
              }),
          widget(context,"images/1.jpg",const Login()),
          widget(context,"images/2.jpg",const Login()),
          widget(context,"images/3.jpg",const Login()),
          widget(context,"images/4.jpg",const Login()),
          widget(context,"images/5.jpg",const Login()),
          widget(context,"images/6.jpg",const Login()),
          widget(context,"images/1.jpg",const Login()),
          widget(context,"images/2.jpg",const Login()),
          widget(context,"images/3.jpg",const Login()),
          widget(context,"images/4.jpg",const Login()),
          widget(context,"images/5.jpg",const Login()),
          widget(context,"images/6.jpg",const Login()),

        ],
      ),
    );

  }
  Widget widget(BuildContext context, String image, Widget className) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => className,));
        },
        child: Container(

          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              color: Colors.blue, borderRadius: BorderRadius.circular(21)),
        ),
      ),
    );
  }

}
