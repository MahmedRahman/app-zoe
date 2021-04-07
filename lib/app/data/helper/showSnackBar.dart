

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({
    @required String title,
    @required String message,
    @required snackbarStatus(),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      overlayBlur: 4,
      borderWidth: 2,
      margin: EdgeInsets.all(10),
      borderColor: Colors.red,
      snackbarStatus: (value) {


        if (value == SnackbarStatus.CLOSED) {
          snackbarStatus();
        }

    
        
        //onstatusBarClosed(value);
      },
    );
  }