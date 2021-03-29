
import 'package:flutter/material.dart';

class BrandModel {
  final String img;
  final Color color;

  BrandModel({
    @required this.img,
    @required this.color,
  });
}

List<BrandModel> brandList = [
  new BrandModel(
    img: 'assets/brand/1.png',
    color: Color(0xFFD6EFF2),
  ),
    new BrandModel(
    img: 'assets/brand/2.png',
    color: Color(0xFFD6EFF2),
  ),
    new BrandModel(
    img: 'assets/brand/3.png',
    color: Color(0xFFD6EFF2),
  ),
    new BrandModel(
    img: 'assets/brand/4.png',
    color: Color(0xFFD6EFF2),
  )
];
