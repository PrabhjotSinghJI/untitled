import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import 'loginotp.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/BLogin.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: emailKey,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.email_outlined, color: Colors.black),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "Email"),
                    validator: (e) {
                      if (emailController.value.text.isEmpty) {
                        return "Invalid email";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.remove_red_eye_outlined,
                          color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: "Password"),
                  validator: (e) {
                    if (emailController.value.text.isEmpty) {
                      return "Enter Password";
                    } else {
                      return null;
                    }
                  },
                  // controller: emailController,
                ),
              ),
            ),
            ElevatedButton(
                child:
                    const Text("Login", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (emailKey.currentState!.validate()) {

                  }
                }),
            ElevatedButton(
                child: const Text("Create a account",
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  // if (emailKey.currentState!.validate()) {
                  //   login();
                  // }
                }),
            // ElevatedButton(
            //     child: const Text("Check Demo",
            //         style: TextStyle(color: Colors.white)),
            //     onPressed: () {
            //       // if (emailKey.currentState!.validate()) {
            //       //   login();
            //       // }
            //     }),
            AnimatedButton(
               width: 150,
              backgroundColor:Colors.blue,
              text: 'Login With OTP',
              selectedTextColor: Colors.black,
              transitionType: TransitionType.BOTTOM_TO_TOP,
              textStyle: const TextStyle(
                  color: Colors.white,
                  ),
              onPress: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => LoginOtp()),);
              },
            )
          ],
        ),
      ),
    );
  }

  void login() {
    print("");
  }
}
