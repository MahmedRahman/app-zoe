import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppUtils.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/cart/model/CartItem.dart';
import 'package:zoe/app/modules/cart/providers/provider_provider.dart';
import 'package:zoe/app/routes/app_pages.dart';

class CartController extends GetxController {
  List<CartItem> listCartItem = List<CartItem>().obs;
  RoundedLoadingButtonController buttonController =
      new RoundedLoadingButtonController();
  var ShappingPrice = 50;
  @override
  void onInit() {}

  Cart() {
    listCartItem = [];
  }

  Future getCartItem() async {
    return await listCartItem;
  }

  addToCart(CartItem cartItem) {
    if (isExitProduct(cartItem) == false) {
      listCartItem.add(cartItem);
    }
  }

  Future CartPack() async {
    return await listCartItem;
  }

  printCart() {
    listCartItem.forEach((element) {
      print(element.Productid);
      print(element.productName);
      print(element.qty.toString());
      print(element.ProductPrice);
    });
    print("Print toal Cart item : " + cartCount().toString());
    print("Print toal Cart Price : " + cartTotalPrice().toString());
  }

  bool isExitProduct(CartItem cartItem) {
    for (CartItem localCartItem in listCartItem) {
      if (localCartItem.Productid == cartItem.Productid) {
        localCartItem.addQty(qty: cartItem.qty);

        return true;
      }
    }
    return false;
  }

  clearCart() {
    listCartItem.clear();
  }

  carClearItem(int index) {
    listCartItem.removeAt(index);
    update();
    showSnackBar(
        title: appName, message: 'تم حذف العنصر', snackbarStatus: () {});
  }

  int cartCount() {
    return listCartItem.length;
  }

  double cartTotalPrice() {
    double price = 0;
    for (CartItem localCartItem in listCartItem) {
      price = price + localCartItem.ProductPrice + ShappingPrice;
    }
    return price;
  }

  double cartTotalProductPrice() {
    double price = 0;
    for (CartItem localCartItem in listCartItem) {
      price = price + localCartItem.ProductPrice;
    }
    return price;
  }

  checkout() async {
    String productList = '';
    String productQty = '';
    var i = 0;

    listCartItem.forEach((CartItem _cartItem) {
      if (i == 0) {
        productList = productList.toString() + _cartItem.Productid.toString();
        productQty = productQty.toString() + _cartItem.qty.toString();
        i = 1;
      } else {
        productList =
            productList.toString() + ',' + _cartItem.Productid.toString();
        productQty = productQty.toString() + ',' + _cartItem.qty.toString();
      }
    });

    await CartProvider().checkout(productList, productQty).then((response) {
      if (response.body['success']) {
        showSnackBar(
            title: appName,
            message: response.body['message'],
            snackbarStatus: () {
              buttonController.reset();
              clearCart();
              Get.toNamed(Routes.LayoutView);
            });
      } else {
        showSnackBar(
            title: appName,
            message: response.body,
            snackbarStatus: () {
              buttonController.reset();
            });
      }
    });

    buttonController.reset();
  }
}
