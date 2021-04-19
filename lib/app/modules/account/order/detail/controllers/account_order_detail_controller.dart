import 'package:get/get.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/modules/account/model/order_history_detailes_model.dart';

class AccountOrderDetailController extends GetxController {
  final OrderHistoryDetail = Future.value().obs;

  getOrderDetailesHistory(String Orderid) async {
    ResponsModel responsModel =
        await WebServices().getOrderDetailsHistory(Orderid);

    if (responsModel.success) {
      Response response = responsModel.data;

      final orderHistoryDetailesModel =
          orderHistoryDetailesModelFromJson(response.bodyString);

      OrderHistoryDetail.value = Future.value(orderHistoryDetailesModel.data);
    }
  }
}
