import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomIndicator extends StatelessWidget {
  CustomIndicator({this.indicatorStatus = IndicatorStatus.wait});

  IndicatorStatus indicatorStatus;
  @override
  Widget build(BuildContext context) {
    switch (indicatorStatus) {
      case IndicatorStatus.wait:
        return CircularProgressIndicator();
        break;

      case IndicatorStatus.error:
        return Lottie.asset('assets/error.json');
        break;

      case IndicatorStatus.imageplaceholder:
        return Lottie.asset('assets/photo.json');
        break;

      case IndicatorStatus.NoProductFound:
        return SizedBox(
          child: Lottie.asset('assets/productnotfound.json'),
          width: 265,
        );
        break;

      case IndicatorStatus.ListProduct:
        return SizedBox(
          width: 265,
          child: Lottie.asset('assets/productloading.json'),
        );
        break;

      default:
        return CircularProgressIndicator();
    }
  }
}

enum IndicatorStatus {
  wait,
  error,
  imageplaceholder,
  ListProduct,
  NoProductFound,
}
