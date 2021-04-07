import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zoe/app/routes/app_pages.dart';
const KuserToken = 'usertoken';

class UserAuth extends GetxService {


  GetStorage storage = GetStorage();

  void setUserToken(String value) {
    storage.write(KuserToken, value);
  }
  
  String getUserToken() {
    return storage.read(KuserToken);
  }

  void signout() {
    setUserToken(null);
    Get.toNamed(Routes.SplashView);
  }

}