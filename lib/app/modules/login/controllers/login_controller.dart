import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/providers/user_provider.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isLoginLoading = false.obs;

  UserProvider userP = UserProvider();

  void login() async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      isLoginLoading.value = true;
      await userP.userLogin(emailC.text, passwordC.text);
      isLoginLoading.value = false;
    }
  }

  void cekLogin() async {
    final box = GetStorage();
    if (box.read("token") == "") {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
