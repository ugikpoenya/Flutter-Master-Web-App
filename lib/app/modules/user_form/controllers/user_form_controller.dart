import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

import '../../../data/providers/user_provider.dart';
import '../../../data/models/user_model.dart';
import '../../../Config.dart';

class UserFormController extends GetxController {
  TextEditingController full_nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  String levelC = 'User';
  String statusC = 'Active';
  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  UserProvider userP = UserProvider();

  Map<String, String?> initBodyRequest(String userId) {
    Map<String, String?> body = {
      "user_id": userId,
      "full_name": full_nameC.text,
      "email": emailC.text,
      "level": levelC,
      "status": statusC,
    };

    if (passwordC.text.isNotEmpty) {
      body.addAll({
        "password": passwordC.text,
      });
    }
    return body;
  }

  void postUser() async {
    isLoading.value = true;
    var response = await userP.postUser(initBodyRequest(""));
    print(response.body);
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.ACCOUNT);
    } else {
      Config().errorResponse(response);
    }
    isLoading.value = false;
  }

  void putUser(String userId) async {
    isLoading.value = true;
    var response = await userP.putUser(userId, initBodyRequest(userId));
    print(response.body);
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.ACCOUNT);
    } else {
      Config().errorResponse(response);
    }
    isLoading.value = false;
  }
}
