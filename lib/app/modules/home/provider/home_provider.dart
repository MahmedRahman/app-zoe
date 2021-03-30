import 'package:get/get.dart';
import 'package:zoe/app/data/model/home_model.dart';
import 'package:zoe/app/data/repostory.dart';

class HomeProvider extends RepostoryProvide {
  HomeModel homeModel;

  Future<HomeModel> getHomePage() async {
    Response response = await repGet('home');
    print(response.bodyString);
    homeModel = homeModelFromJson(response.bodyString);
    return homeModel;
  }

  Future<List<BrandElement>> getCategory() async {
    Response response = await repGet('home');
    print(response.bodyString);
    homeModel = homeModelFromJson(response.bodyString);
    return homeModel.data.departments;
  }

  Future<List<BrandElement>> getBrand() async {
    Response response = await repGet('home');
    print(response.bodyString);
    homeModel = homeModelFromJson(response.bodyString);
    return homeModel.data.brands;
  }

  Future<List<FeaturedCategory>> getFeaturedCategories() async {
    Response response = await repGet('home');
    print(response.bodyString);
    homeModel = homeModelFromJson(response.bodyString);
    return homeModel.data.featuredCategories;
  }

  
}