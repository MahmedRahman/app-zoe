import 'package:get/get.dart';

class AppValidation {
  static String checkEmail(String value) {
    if (GetUtils.isEmail(value) == false) {
      return 'Not vaild Email'.tr;
    } else {
      return null;
    }
  }

  static String checkEmpty(String value) {
    if (value.isEmpty) {
      return 'Empty String'.tr;
    }
    return null;
  }

  static String checkMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number'.tr;
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number'.tr;
    }
    return null;
  }

  static String checklength(String value, int lenindex) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < lenindex) {
      return 'A valid string should be of '.tr +
          lenindex.toString() +
          ' digits'.tr;
    }
    return null;
  }


    static String equallength(String value, int lenindex) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    if (value.length == lenindex) {
      return 'A valid string should be of '.tr +
          lenindex.toString() +
          ' digits'.tr;
    }
    return null;
  }
}
