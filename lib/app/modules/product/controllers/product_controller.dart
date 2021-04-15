import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/api/model/department_products_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/api/model/category_products_model.dart';
import 'package:zoe/app/api/model/products_brand_model.dart';
import 'package:zoe/app/api/model/products_detaile_model.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/cart/model/CartItem.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  RoundedLoadingButtonController buttonController =
      new RoundedLoadingButtonController();

  var productSizeSelect = 0.obs;
  var productColorSelect = 0.obs;
  Future getProductByCategory(String categoryId) async {
    Response response = await WebServices().getProductByCategory(categoryId);

    final categoryProductsModel =
        categoryProductsModelFromJson(response.bodyString);

    return categoryProductsModel.data.products;
  }

  Future getProductByDepartments(String departmentsId) async {
    Response response =
        await WebServices().getProductByDepartments(departmentsId);
    final departmentProductsModel =
        departmentProductsModelFromJson(response.bodyString);

    return departmentProductsModel.data.products;
  }

  Future getProductDetailes(String productId) async {
    Response response = await WebServices().getProductDetailes(productId);
    final productsDetaileModel =
        productsDetaileModelFromJson(response.bodyString);

    return productsDetaileModel;
  }

  Future getProductByBrand(String brandId) async {
    Response response = await WebServices().getProductByBrand(brandId);
    final productsBrandModel = productsBrandModelFromJson(response.bodyString);
    return productsBrandModel.data.products;
  }

  void productAddToCart(ProductsDetaileModel productsDetaile) {
    bntrest();
    showSnackBar(
      title: appName,
      message: 'تم الاضافة الى سلة المشتريات',
      snackbarStatus: () {
        Get.find<CartController>().addToCart(
          new CartItem(
            productimage: productsDetaile.data.productImages[0],
            productid: productsDetaile.data.product.id,
            productName: productsDetaile.data.product.name,
            productPrice: productSizeSelect.value == 0
                ? productsDetaile.data.product.price
                : productsDetaile.data.product.sizes
                    .elementAt(productSizeSelect.value)
                    .price,
            productColor: productsDetaile.data.product.colors.length == 0
                ? 0
                : productsDetaile.data.product.colors
                    .elementAt(productColorSelect.value)
                    .id,
            productSize: productsDetaile.data.product.sizes.length == 0
                ? 0
                : productsDetaile.data.product.sizes
                    .elementAt(productSizeSelect.value)
                    .id,
            qty: 1,
          ),
        );
        //productsDetaile.data.product.sizes.elementAt(index).price
        //Get.toNamed(Routes.LayoutView);
        //Get.find<HomeController>().selectindex.value = 3;
      },
    );
  }

  bntrest() {
    buttonController.reset();
  }

  Future SetFavoraitProduct(String brandId) async {
    Response response = await WebServices().setFavoraitProduct(brandId);
    print(response.bodyString);
  }
}
