import 'package:get/get.dart';

const appName = 'Zoe';
//const siteUrl = "https://active4web.com/yusr";
//const apikey = '1234567890';

double Klatitude = 0;
double Klongitude = 0;

var Kaddress = ''.obs;

var additionalFees;

int tax;

int freeshipingamount = 0;

List<dynamic> city = [
];

List<dynamic> delivery_fees = [
];
/*
  {"id": 3, "title": "البطاقة الائتمانية", "additional_fees": 0},
  {"id": 5, "title": "الدفع عند الإستلام", "additional_fees": 20}
*/
var delivery_days;
var shipping_fees;
