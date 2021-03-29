import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:zoe/app/modules/order/controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  