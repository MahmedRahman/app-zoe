import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/user_provile.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class AccountView extends StatelessWidget {
  //AccountController controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    AccountController controller = Get.find<AccountController>();
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: controller.userProfile,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  UserProfileModel userProfileModel = snapshot.data;
                  return Column(
                    children: [
                      Text(userProfileModel.data.name),
                      Text(userProfileModel.data.email),
                      Text(userProfileModel.data.mobile),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: CustomIndicator(
                    indicatorStatus: IndicatorStatus.error,
                  ));
                }
                return Center(child: CustomIndicator());
              }),
          Card(
            child: ListTile(
              title: Text('طلباتى'),
              leading: SvgPicture.asset('assets/order.svg'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.AccountOrderHistoryView);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('عناوين'),
              leading: SvgPicture.asset('assets/address.svg'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.AccountAdressView);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('المفضلة'),
              leading: SvgPicture.asset('assets/favarit.svg'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.AccountWishListView);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('مركز المساعدة'),
              leading: SvgPicture.asset('assets/helpcenter.svg'),
              trailing: Text('01000000000'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('حول زوي'),
              leading: SvgPicture.asset('assets/about.svg'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.AccountAboutView);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('تسجيل الخروج'),
              leading: SvgPicture.asset('assets/signout.svg'),
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
