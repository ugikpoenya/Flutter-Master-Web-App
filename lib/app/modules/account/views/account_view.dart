import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

import '../controllers/account_controller.dart';
import '../../../widgets/init_navigation.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccountView'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          initNavigation(
            route_name: Routes.ACCOUNT,
          ),
          Expanded(child: Center(child: Text("AccountView")))
        ],
      ),
    );
  }
}
