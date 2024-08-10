// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  //Text editing controller to get access to what the User typed
  TextEditingController mycontroller = TextEditingController();

  // Message greeting variable
  String greetMessage = "";

  // User greet method
  void greetUser() {
    String userName = mycontroller.text;

    setState(() {
      greetMessage = 'Hello, ' + userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Message à afficher
              Text(greetMessage),

              TextField(
                controller: mycontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Type your name: '),
              ),

              Padding(padding: EdgeInsets.only(top: 10)),

              // Button
              ElevatedButton(
                  onPressed: greetUser,
                  child: Text(
                    'Tap!',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
