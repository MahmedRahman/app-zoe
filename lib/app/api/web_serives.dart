import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/api_manger.dart';
import 'package:zoe/app/api/response_model.dart';

class WebServices extends APIManger {
  Future<ResponsModel> getProfile() async {
    ResponsModel response = await repGet('profile');
    return response;
  }

  Future<ResponsModel> getWishList() async {
    ResponsModel response = await repGet('wishlist');
    return response;
  }

  Future<ResponsModel> getOrderHistory() async {
    ResponsModel response = await repGet('orders');
    return response;
  }

  Future<ResponsModel> getOrderDetailsHistory(String orderid) async {
    ResponsModel response = await repGet('orders/' + orderid);
    return response;
  }

  Future<ResponsModel> getAccountAdress() async {
    ResponsModel response = await repGet('user_address');
    return response;
  }

  Future<ResponsModel> addAccountAdress(String address, int city) async {
    ResponsModel response =
        await repPost('user_address', {'address': address, 'city': city});
    return response;
  }

  Future<ResponsModel> getDepartments() async {
    ResponsModel response = await repGet('departments');
    return response;
  }

  Future<ResponsModel> getDepartmentCategoryandBrand(int departmentId) async {
    ResponsModel response =
        await repGet('department/' + departmentId.toString());
    return response;
  }

  Future<ResponsModel> getCity() async {
    ResponsModel response = await repGet('cities');
    return response;
  }

  Future<ResponsModel> createUser({
    @required String name,
    @required String email,
    @required String mobile,
    @required String password,
    @required String code,
  }) async {
    ResponsModel response = await repPost(
        'register',
        {
          "name": name,
          "email": email,
          "mobile": mobile,
          "password": password,
          "code": code,
        },
        showLoading: true);

    return response;
  }

  Future<ResponsModel> signin({
    @required String mobile,
    @required String password,
  }) async {
    ResponsModel response = await repPost(
        'login',
        {
          "mobile": mobile,
          "password": password,
        },
        showLoading: true);

    return response;
  }

  Future<ResponsModel> getbrand() async {
    ResponsModel response = await repGet('brands');
    return response;
  }

  Future<ResponsModel> checkout({
    @required String productsList,
    @required String qtyList,
    @required int addressid,
    @required String colors,
    @required String sizes,
    String discount_code
  }) async {
    ResponsModel response = await repPost(
      'checkout',
      {
        'products': productsList,
        'qty': qtyList,
        'pay_method': '1',
        'address': addressid,
        'colors': colors,
        'sizes': sizes,
        GetUtils.isNullOrBlank(discount_code) ? '' : 'discount_code' : discount_code,
      },
    );
    return response;
  }

  Future<ResponsModel> getProductByCategory(String categoryId) async {
    ResponsModel response = await repGet('category/$categoryId');
    return response;
  }

  Future<ResponsModel> getProductByDepartments(String departmentsId) async {
    ResponsModel response = await repGet('department_products/$departmentsId');
    return response;
  }

  Future<ResponsModel> deleteUserAddress(int userAddresId) async {
    ResponsModel response =
        await repPost('delete_user_address/' + userAddresId.toString(), '');
    return response;
  }

  Future<ResponsModel> getProductByBrand(String brandId) async {
    ResponsModel response = await repGet('brands/$brandId');
    return response;
  }

  Future<ResponsModel> getProductDetailes(String productId) async {
    ResponsModel response = await repGet('product/$productId');
    return response;
  }

  Future<ResponsModel> setFavoraitProduct(String productId) async {
    ResponsModel response =
        await repPost('wishlist_product', {'product': productId});
    return response;
  }

  Future<ResponsModel> getHomePage() async {
    ResponsModel response = await repGet('home');
    return response;
  }

  Future<ResponsModel> setSmsCode(String mobile) async {
    ResponsModel response =
        await repPost('sms_code', {'mobile': mobile}, showLoading: true);
    return response;
  }

  Future<ResponsModel> getVersion() async {
    ResponsModel response = await repPost(
        'https://dev.matrixclouds.com/zoe/public/api/api_version',
        {'version': '1.0.0'});
    return response;
  }

  Future<ResponsModel> getPromoCodeChecker(String discount_code) async {
    ResponsModel response = await repPost('promo_code', {
      'discount_code': discount_code,
    },showLoading: true);
    return response;
  }
}
