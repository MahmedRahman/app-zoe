import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String name;
  final String img;
  final Color color;

  CategoryModel({
    @required this.name,
    @required this.img,
    @required this.color,
  });
}

List<CategoryModel> categoryList = [
  new CategoryModel(
    name: 'العطور',
    color: Color(0xFFD6EFF2),
    img: 'assets/category/perfume.png',
  ),
  new CategoryModel(
    name: 'مستحضرات التجميل',
    color: Color(0xFFFEF1CC),
    img: 'assets/category/makeup.png',
  ),
  new CategoryModel(
    name: 'العناية باالشعر',
    color: Color(0xFFFEF2ED),
    img: 'assets/category/skincare.png',
  ),
  new CategoryModel(
    name: 'العناية باالبشرة',
    color: Color(0xFFCECCFD),
    img: 'assets/category/skincare.png',
  )
];
