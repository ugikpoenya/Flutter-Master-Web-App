import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

import '../controllers/settings_controller.dart';
import '../../../widgets/init_navigation.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsView'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          initNavigation(
            route_name: Routes.SETTINGS,
          ),
          Expanded(child: Center(child: Text("SettingsView")))
        ],
      ),
    );
  }
}
