import 'package:get/get.dart';
import 'package:zoe/app/data/model/home_model.dart';
import 'package:zoe/app/data/repostory.dart';

class HomeProvider extends RepostoryProvide {
  HomeModel homeModel;

  Future getData() async {

  //  return homeModel;
  }

  Future<HomeModel> getHomePage() async {
        Response response = await repGet('home');
    homeModel = homeModelFromJson(response.bodyString);
    return homeModel;
  }

  Future<List<BrandElement>> getCategory() async {
    return homeModel.data.departments;
  }

  Future<List<BrandElement>> getBrand() async {
    return homeModel.data.brands;
  }

  Future<List<FeaturedCategory>> getFeaturedCategories() async {
    return homeModel.data.featuredCategories;
  }
}
