import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AccountWishListView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccountWishListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AccountWishListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
