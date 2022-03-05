import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../../../widgets/init_navigation.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          initNavigation(
            route_name: Routes.HOME,
          ),
          Expanded(child: Center(child: Text("Dashboard")))
        ],
      ),
    );
  }
}
