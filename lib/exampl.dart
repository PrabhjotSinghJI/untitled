

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:untitled/selectbrand.dart';
import 'loginotp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isVisible = false;

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
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.black),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: "Email"),
                    validator: (value) {
                      if(value!.isEmpty){
                        return  "Email required";
                      }
                      if (!EmailValidator.validate(emailController.value.text)) {
                        return "Invalid Email";
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
                child: Form(
                  key: passwordKey,
                  child: TextFormField(
                    obscureText: _isVisible ? false : true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () => updateStatus(),
                        icon: Icon(
                            _isVisible ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),

                    validator: (e) {
                      if (passwordController.value.text.isEmpty) {
                        return "Enter Password";
                      }
                      else if(passwordController.value.text.length < 8){
                        return "8 characters required";
                      }
                      else {
                        return null;
                      }
                    },
                    // controller: emailController,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                child:
                    const Text("Login", style: TextStyle(color: Colors.white)),
                onPressed: () {

                  if (emailKey.currentState!.validate()& passwordKey.currentState!.validate()) {
                    login(emailController.value.text,passwordController.value.text);
                  }
                }),
            ElevatedButton(
                child: const Text("Create a account",
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  signup();
                }),
            AnimatedButton(
              width: 150,
              backgroundColor: Colors.blue,
              text: 'Login With OTP',
              selectedTextColor: Colors.black,
              transitionType: TransitionType.BOTTOM_TO_TOP,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginOtp()),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password)
      .then((value) => {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const Brand())),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        showDialog(context: context, builder: (ctx) =>
            AlertDialog(
              title: const Text("Error", style: TextStyle(color: Colors.red),),
              content: const Text("Password"),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(ctx);
                }, child: const Text("ok"))
              ],
            ),);
      } else if (e.code == "too-many-requests") {
        showDialog(context: context, builder: (ctx) =>
            AlertDialog(
              title: const Text("Request Error", style: TextStyle(color: Colors.red),),
              content: const Text(" Network  "),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(ctx);
                }, child: Text("ok"))
              ],
            ),);
      }
    }
  }
    void updateStatus() {
      setState(() {
        if (_isVisible) {
          _isVisible = false;
        }
        else {
          _isVisible = true;
        }
      });
    }
  }

