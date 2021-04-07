import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ServererroView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ServererroView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ServererroView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
