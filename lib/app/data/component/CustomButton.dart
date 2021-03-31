import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.title,
    this.onPressed,
  });

  final String title;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(title),
    );
  }
}
