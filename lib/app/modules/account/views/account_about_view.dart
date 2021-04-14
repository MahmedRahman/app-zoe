import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';

class AccountAboutView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustemAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'نحن مؤسسة القمر الكامل التجارية سجل تجاري رقم (2050134533) أصحاب العلامة التجارية زوي نعمل في مجال بيع العطور و منتاجات التجميل و منتجات العناية بالبشرة تأسست في العام 2020 م  ونظرا لما أكتسبته المؤسسة وفريق عملها من خبرة  متراكمة طوال الفترة الماضية  ولرغبتنا في إبراز ثقافة وهوية الإبداع السعودي و الخليجي  فقد كان لازم علينا أن نوكب التطور التقني و التكنولوجي المتسارع وفقا لمقتضيات المرحلة ولتلبية رغبات العملاء الذين لايستطيعون الوصول إلى متطلباتهم وقد قمنا بإطلاق متجرنا الألكتروني و تطبيق زوي للأجهزة الذكية لنكون أكثر قربا من العملاء في جميع دول العالم .',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
