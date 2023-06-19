import 'package:flutter/material.dart';


class Brand extends StatelessWidget {
  const Brand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(crossAxisCount: 15,
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
            child: Container(decoration: const BoxDecoration(

            )
            ),
            )
          ],

        ),
      ),

    );
  }
}
