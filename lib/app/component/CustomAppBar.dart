import 'package:flutter/material.dart';

AppBar CustemAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: SizedBox(
        height: 100,
        child: Image.asset('assets/logo.png'),
      ),
      centerTitle: true,
   
    );
  }