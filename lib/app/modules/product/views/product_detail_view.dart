import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/model/home_model.dart';
import 'package:zoe/app/data/model/products_detaile_model.dart';

import 'package:zoe/app/modules/product/controllers/product_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class ProductDetailView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getProductDetailes(Get.arguments[0].toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ProductsDetaileModel productsDetaile = snapshot.data;
              return ListView(
                children: [
                  SizedBox(
                    height: Get.height * .3,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset('assets/perfumeWoman/2.png'),
                        Image.asset('assets/perfumeWoman/2.png'),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(productsDetaile.data.product.name),
                    subtitle: Text(productsDetaile.data.department.name),
                    leading: Image.asset('assets/productbrand.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'الاحجام',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('75 ممل'),
                    trailing: Text('340 ريال'),
                  ),
                  ListTile(
                    title: Text('105 ممل'),
                    trailing: Text('300 ريال'),
                  ),
                  SizedBox(
                    height: Get.height * .4,
                    child: DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        appBar: TabBar(
                          labelColor: Colors.grey,
                          tabs: [
                            Tab(
                              child: Text('الوصف'),
                            ),
                            Tab(
                              child: Text('الخصائص'),
                            ),
                            Tab(
                              child: Text('المراجعات'),
                            ),
                          ],
                        ),
                        body: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                  productsDetaile.data.product.desc.toString()),
                            ),
                            Column(
                              children: [
                                ListTile(
                                  title: Text('الحجم'),
                                  subtitle: Text('75 ممل'),
                                  trailing: Text('340.00'),
                                )
                              ],
                            ),
                            ListView(
                              children: List.generate(5, (index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      trailing: Text('5/2/2021'),
                                      title: Text('Mohamed Kamel'),
                                      leading: Icon(Icons.contacts),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: RatingBarIndicator(
                                          rating: 3,
                                          itemCount: 5,
                                          itemSize: 25.0,
                                          direction: Axis.horizontal,
                                          physics: BouncingScrollPhysics(),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العرب"),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
         
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Text('الكمية'),
                      title: Text('1'),
                      trailing: RaisedButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.HOME);
                        },
                        icon: Icon(Icons.shop_two),
                        label: Text('أضف للسلة'),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Text(' No data');
            }
          }),
    );
  }
}
