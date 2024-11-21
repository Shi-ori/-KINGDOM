import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 300,
            height: 300,
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            )),
        Container(
          margin: EdgeInsets.only(left: 120, top: 10), 
          child: const Text(
            "UserName",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ],
    ));

    //throw UnimplementedError();
  }
}
