import 'package:get/get.dart';
import 'package:zoe/app/data/repostory.dart';

class AccountProvider extends RepostoryProvide {
  
  Future getProfile() async {
    return await repGet('profile').then((Response response) {
      return response;
    });
  }

  Future getOrderHistory() async {
    return await repGet('orders').then((Response response) {
      return response;
    });
  }

  Future getOrderDetailsHistory(String Orderid) async {
    return await repGet('orders/' + Orderid).then((Response response) {
      print(response.bodyString);
      return response;
    });
  }

  Future getAccountAdress() async {
    return await repGet('user_address').then((Response response) {
      return response;
    });
  }
}
