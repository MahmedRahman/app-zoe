import 'package:get/get.dart';

const appName = 'Zoe';
//const siteUrl = "https://active4web.com/yusr";
//const apikey = '1234567890';

double Klatitude = 0;
double Klongitude = 0;

var Kaddress = ''.obs;

var additionalFees;

int tax;

List<dynamic> city = [
  {"id": 5, "title": "الخبر"},
  {"id": 6, "title": "الخبر"},
  {"id": 9, "title": "الخرج"},
  {"id": 3, "title": "الدمام"},
  {"id": 1, "title": "الرياض"},
  {"id": 8, "title": "الرياض"},
  {"id": 4, "title": "القطيف"},
  {"id": 7, "title": "القطيف"},
  {"id": 2, "title": "جده"}
];

List<dynamic> delivery_fees = [
  {"id": 3, "title": "البطاقة الائتمانية", "additional_fees": 0},
  {"id": 4, "title": "الأستلام من المتجر", "additional_fees": 0},
  {"id": 5, "title": "الدفع عند الإستلام", "additional_fees": 20}
];

var delivery_days;
var shipping_fees;
