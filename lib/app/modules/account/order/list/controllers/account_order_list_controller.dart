import 'package:get/get.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/modules/account/model/order_history_model.dart';

class AccountOrderListController extends GetxController {
  final OrderHistoryList = Future.value().obs;

  getOrderHistory() async {
    ResponsModel responsemodel = await WebServices().getOrderHistory();
    if (responsemodel.success) {
      Response response = responsemodel.data;
      final orderHistoryModel = orderHistoryModelFromJson(response.bodyString);
      OrderHistoryList.value = Future.value(orderHistoryModel.data);
    }
  }
}
