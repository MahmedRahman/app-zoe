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

      Map<String, List<Datum>> groupData =
          orderHistoryModel.data.groupBy((m) => m.orderDate.toString());
      OrderHistoryList.value = Future.value(groupData);

      OrderHistoryList.value = Future.value(orderHistoryModel.data);

      //print(groupData.);

    }
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
