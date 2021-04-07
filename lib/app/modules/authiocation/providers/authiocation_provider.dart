import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/repostory.dart';

class AuthiocationProvider extends RepostoryProvide {
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

    print(response.bodyString);

    return response;
  }

  Future<Response> signin({
    @required String mobile,
    @required String password,
  }
  ) async {
    Response response = await repPost('login', {
      "mobile": mobile,
      "password": password,
    });

        print(response.bodyString);

    return response;
  }
}
