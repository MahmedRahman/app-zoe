import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zoe/app/component/CustomIndicator.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/user_provile.dart';
import 'package:zoe/app/modules/account/views/acount_profile.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class AccountView extends StatelessWidget {
  AccountController controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GetX<AccountController>(builder: (builder) {
            return FutureBuilder(
                future: controller.userProfile.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserProfileModel userProfileModel = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: Column(
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'بيانات شخصية',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: KprimaryColor,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(
                                        AcountProfile(
                                          //Name: userProfileModel.data.name,
                                         // Email: userProfileModel.data.email,
                                        ),
                                        fullscreenDialog: true,
                                      );
                                    },
                                    child: Text(
                                      'تعديل',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            leading: Text(
                              'الاسم',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Text(userProfileModel.data.name),
                          ),
                          ListTile(
                            leading: Text(
                              'الايميل',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Text(userProfileModel.data.email),
                          ),
                          ListTile(
                            leading: Text(
                              'رقم الهاتف',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Text(userProfileModel.data.mobile),
                          ),
                        ],
                      )),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: CustomIndicator(
                      indicatorStatus: IndicatorStatus.error,
                    ));
                  }
                  return Center(child: CustomIndicator());
                });
          }),
          SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'إعدادات عامة',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          Card(
            child: ListTile(
              title: Text('طلباتى'),
              leading: SvgPicture.asset(
                'assets/order.svg',
                color: Color(0xff4C1711),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.ACCOUNT_ORDER_LIST);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('عناوين'),
              leading: SvgPicture.asset(
                'assets/address.svg',
                color: Color(0xff4C1711),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.ACCOUNT_ADRESS_LIST);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('المفضلة'),
              leading: SvgPicture.asset(
                'assets/favarit.svg',
                color: Color(0xff4C1711),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.AccountWishListView);
              },
            ),
          ),
          /*  Card(
            child: ListTile(
              title: Text('مركز المساعدة'),
              leading: SvgPicture.asset(
                'assets/helpcenter.svg',
                color: Color(0xff4C1711),
              ),
              trailing: Text('01000000000'),
            ),
          ),*/
          Card(
            child: ListTile(
              title: Text('حول زوي'),
              leading: SvgPicture.asset(
                'assets/about.svg',
                color: Color(0xff4C1711),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed(Routes.AccountAboutView);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('تسجيل الخروج'),
              leading: SvgPicture.asset(
                'assets/signout.svg',
                color: Color(0xff4C1711),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Get.find<UserAuth>().setUserToken(null);
                Kselectindex.value = 2;
                //setUserToken(null);
                //Get.offAndToNamed(Routes.SigninView);
              },
            ),
          )
        ],
      ),
    );
  }
}
