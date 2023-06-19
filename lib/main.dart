
import 'package:flutter/material.dart';
import 'package:untitled/welcome.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);




  @override

  Widget build(BuildContext context) {
    return   const MaterialApp(

        home: Welcome(),
    );
  }

}


















    //   MaterialApp(
    //   home: Scaffold(
    //     body: SafeArea(
    //       child: Column(
    //         children: [
    //           const Center(
    //               child: Text(
    //             "Welcome",
    //             style: TextStyle(fontSize: 22, fontFamily: "SlacksideOne"),
    //           )),
    //           SizedBox(
    //               width: MediaQuery.of(context).size.width / 2,
    //               child: Form(
    //                 key: emailKey,
    //                 child: Center(
    //                   child: SizedBox(
    //                     width: 300,
    //                     child: TextFormField(
    //                     validator: (errors){
    //                       if(emailController.value.text.isEmpty){
    //                         return "email required";
    //
    //                       }else if(emailController.value.text.length < 2){
    //                         return "Invalid email";
    //                       }
    //
    //                       else{
    //                         return null;
    //                       }
    //                     },
    //                       keyboardType: TextInputType.emailAddress,
    //                       controller: emailController,
    //                     ),
    //
    //
    //                   ),
    //                 ),
    //
    //
    //               ),
    //           ),
    //           CupertinoButton(onPressed: (){
    //
    //            if( emailKey.currentState!.validate()){
    //              login(emailController.value.text);
    //            }
    //
    //           }, child: const Text("fill me"))
    //         ],
    //       ),
    //     ),
    //   ),
    // );


    //





