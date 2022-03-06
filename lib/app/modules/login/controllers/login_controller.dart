import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/providers/user_provider.dart';
import '../../../data/models/user_model.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isLoginLoading = false.obs;

  UserProvider userP = UserProvider();
  final box = GetStorage();

  void login() async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      isLoginLoading.value = true;
      var response = await userP.userLogin(emailC.text, passwordC.text);

      if (response.statusCode == 200) {
        box.write("token", response.body['token']);
        User user = User.fromJson(response.body['user']);
        box.write('full_name', user.fullName);
        box.write('email', user.email);

        Get.offAllNamed(Routes.HOME);
      } else {
        if (response.body['messages']['error'] != null) {
          Get.snackbar(
            "Error",
            response.body['messages']['error'],
            backgroundColor: Colors.red,
          );
        } else {
          Get.snackbar(
            "Error",
            "Invalid email or password",
            backgroundColor: Colors.red,
          );
        }
      }

      isLoginLoading.value = false;
    }
  }
}
