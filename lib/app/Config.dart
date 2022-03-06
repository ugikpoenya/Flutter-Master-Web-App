import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

class Config extends GetxController {
  final String BASE_URL = "https://api.ugikpoenya.net/";
  final box = GetStorage();

  void errorResponse(Response<dynamic> response) {
    if (response.statusCode != 200) {
      if (response.body['messages'] != null) {
        var messages = response.body['messages'];
        var msg = "";
        messages.forEach((k, v) {
          msg += v + "\n";
        });
        Get.snackbar(
          "Error",
          msg,
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
