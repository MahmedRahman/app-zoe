import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/api_manger.dart';

class WebServices extends APIManger {
  Future<Response> getProfile() async {
    Response response = await repGet('profile');
    return response;
  }

  Future<Response> getWishList() async {
    Response response = await repGet('wishlist');
    return response;
  }

  Future<Response> getOrderHistory() async {
    Response response = await repGet('orders');
    return response;
  }

  Future<Response> getOrderDetailsHistory(String orderid) async {
    Response response = await repGet('orders/' + orderid);
    return response;
  }

  Future<Response> getAccountAdress() async {
    Response response = await repGet('user_address');
    return response;
  }

  Future<Response> addAccountAdress(String address, int city) async {
    Response response =
        await repPost('user_address', {'address': address, 'city': city});
    return response;
  }

  Future<Response> getDepartments() async {
    Response response = await repGet('departments');
    return response;
  }

  Future<Response> getDepartmentCategoryandBrand(int departmentId) async {
    Response response = await repGet('department/' + departmentId.toString());
    return response;
  }

  Future<Response> getCity() async {
    Response response = await repGet('cities');
    return response;
  }

  Future<Response> createUser({
    @required String name,
    @required String email,
    @required String mobile,
    @required String password,
  }) async {
    Response response = await repPost('register', {
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
    });

    return response;
  }

  Future<Response> signin({
    @required String mobile,
    @required String password,
  }) async {
    Response response = await repPost('login', {
      "mobile": mobile,
      "password": password,
    });

    return response;
  }

  Future<Response> getbrand() async {
    Response response = await repGet('brands');
    return response;
  }

  Future<Response> checkout({
    @required String productsList,
    @required String qtyList,
    @required int addressid,
    @required String colors,
    @required String sizes,
  }) async {
    Response response = await repPost(
      'checkout',
      {
        'products': productsList,
        'qty': qtyList,
        'pay_method': '1',
        'address': addressid,
        'colors': colors,
        'sizes': sizes
      },
    );
    return response;
  }

  Future<Response> getProductByCategory(String categoryId) async {
    Response response = await repGet('category/$categoryId');
    return response;
  }

  Future<Response> getProductByDepartments(String departmentsId) async {
    Response response = await repGet('department_products/$departmentsId');
    return response;
  }

  Future<Response> deleteUserAddress(int userAddresId) async {
    Response response =
        await repPost('delete_user_address/' + userAddresId.toString(), '');
    return response;
  }

  Future<Response> getProductByBrand(String brandId) async {
    Response response = await repGet('brands/$brandId');
    return response;
  }

  Future<Response> getProductDetailes(String productId) async {
    Response response = await repGet('product/$productId');
    return response;
  }

  Future<Response> setFavoraitProduct(String productId) async {
    Response response =
        await repPost('wishlist_product', {'product': productId});
    return response;
  }

  Future<Response> getHomePage() async {
    Response response = await repGet('home');
    return response;
  }
}
