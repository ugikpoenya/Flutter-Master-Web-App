import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

class Config extends GetxController {
  final String BASE_URL = "https://api.ugikpoenya.net/";
  final box = GetStorage();

  void errorResponse(Response<dynamic> response) {
    if (response.statusCode != 200) {
      if (response.body['messages']['error'] != null) {
        Get.snackbar(
          "Error",
          response.body['messages']['error'],
          backgroundColor: Colors.red,
        );
      }
    }

    if (response.statusCode == 401) {
      box.write('token', '');
      box.write('full_name', '');
      box.write('email', '');
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
