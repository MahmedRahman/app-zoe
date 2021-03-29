import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class DialogviewView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogviewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DialogviewView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  