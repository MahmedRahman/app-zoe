import 'package:get/get.dart';
import 'package:zoe/app/modules/account/model/account_adrees_model.dart';
import 'package:zoe/app/modules/account/model/order_history_detailes_model.dart';
import 'package:zoe/app/modules/account/model/order_history_model.dart';
import 'package:zoe/app/modules/account/providers/account_provider.dart';

class AccountController extends GetxController {
  //TODO: Implement AccountController

  @override
  void onInit() {}



    getProfile() async {
    return await AccountProvider().getProfile().then((response) {
    
      return response.body;
    });
  }

  getOrderHistory() async {
    return await AccountProvider().getOrderHistory().then((response) {
      final orderHistoryModel = orderHistoryModelFromJson(response.bodyString);
      return orderHistoryModel.data;
    });
  }

  getOrderDetailesHistory(String Orderid) async {
    return await AccountProvider()
        .getOrderDetailsHistory(Orderid)
        .then((response) {
          print(response.bodyString);
      final orderHistoryDetailesModel =
          orderHistoryDetailesModelFromJson(response.bodyString);

      return orderHistoryDetailesModel.data;
    });
  }

  getAccountAdress() async {
    return await AccountProvider().getAccountAdress().then((response) {
      final accountAdreesModel = accountAdreesModelFromJson(response.bodyString);
      return accountAdreesModel.data;
    });
  }


}
