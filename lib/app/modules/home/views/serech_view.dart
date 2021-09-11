import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/model/home_model.dart';
import 'package:zoe/app/component/CustomImageCached.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/routes/app_pages.dart';

class Serech_view extends StatelessWidget {
  var data;
  Serech_view(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بحث'),
      ),
      body: Container(
        child: SizedBox(
          height: Get.height ,
          child: GridView.count(
            shrinkWrap: true,
            childAspectRatio: .6,
            crossAxisCount: 2,
            children: List.generate(data.length, (index) {
              Offer product = Offer.fromJson(data[index]);
              return ProductItem(
                product: product,
              );
            }),
          ),
        ),
      ),
    );
  }
}
