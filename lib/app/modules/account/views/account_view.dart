import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class AccountView extends StatelessWidget {

  AccountController controller =Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         FutureBuilder(
            future: controller.getProfile(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
               return Column(
                 children: [
                   Text(snapshot.data['data']['name']),
                   Text(snapshot.data['data']['email']),
                    Text(snapshot.data['data']['mobile']),
                 ],
               );
              
              } else if(snapshot.hasError){

              }
              return Center(
                child: Text(
                  'قيد التنفيذ',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
          ),
         /* ListTile(
            title: Text('تعديل الحساب'),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.arrow_forward),
          ),*/
          Card(
            child: ListTile(
              title: Text('طلباتى'),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.AccountOrderHistoryView);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('عناوين'),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.AccountAdressView);
              },
            ),
          ), Card(
            child: ListTile(
              title: Text('قائمة الامنيات'),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
               Get.toNamed(Routes.AccountWishListView);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('مركز المساعدة'),
              leading: Icon(Icons.account_circle),
              trailing: Text('01000000000'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('حول زوي'),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Get.toNamed(Routes.AccountAboutView);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('تسجيل الخروج'),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.find<UserAuth>().signout();
              },
            ),
          )
        ],
      ),
    );
  }
}
