import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String textName;
  VoidCallback onPressed;

  MyButton({super.key, required this.textName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColorDark,
      child: Text(textName),
    );
  }
}
