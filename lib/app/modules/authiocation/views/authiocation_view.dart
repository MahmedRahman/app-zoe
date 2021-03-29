import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/authiocation/controllers/authiocation_controller.dart';

class AuthiocationView extends GetView<AuthiocationController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('AuthiocationView'),
        centerTitle: true,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'AuthiocationView is working',
                        style: TextStyle(fontSize: size.height * .05),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Center(
                          child: Text(
                            'AuthiocationView is working',
                            style: TextStyle(fontSize: size.height * .05),
                          ),
                        ),
                      ), Flexible(
                        child: Center(
                          child: Text(
                            'AuthiocationView is working',
                            style: TextStyle(fontSize: size.height * .05),
                          ),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: Center(
                      child: Text(
                        'AuthiocationView is working',
                        style: TextStyle(fontSize: size.height * .05),
                      ),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Text(
                    'AuthiocationView is working',
                    style: TextStyle(fontSize: size.height * .05),
                  )
                ],
              );
      }),
    );
  }
}
