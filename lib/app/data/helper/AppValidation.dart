import 'package:get/get.dart';

class AppValidation {
  static String checkEmail(String value) {
    if (GetUtils.isEmail(value) == false) {
      return 'خطاء فى البريد الالكترونى';
    } else {
      return null;
    }
  }

  static String checkEmpty(String value) {
    if (value.isEmpty) {
      return 'مطلوب';
    }
    return null;
  }

  static String checkMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'الرجاء إدخال رقم هاتف محمول صحيح';
    } else if (!regExp.hasMatch(value)) {
      return 'الرجاء إدخال رقم هاتف محمول صحيح';
    }
    return null;
  }

  static String checklength(String value, int lenindex) {
    if (value.isEmpty) {
      return 'هذه الخانة مطلوبه';
    }
    if (value.length < lenindex) {
      return 'برجا كتابة ارقام اكبر من '.tr +
          lenindex.toString() +
          ' رقم'.tr;
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
