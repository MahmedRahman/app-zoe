import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.title, this.onPressed, this.buttonController});

  final RoundedLoadingButtonController buttonController;

  final String title;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      controller: buttonController,
      color:  Color(0xff4C1711),
      onPressed: () {
        FocusScope.of(context).unfocus();
        onPressed();
      },
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
