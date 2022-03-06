import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../data/providers/user_provider.dart';
import '../../../Config.dart';

class AccountController extends GetxController {
  RxBool isAccountLoading = false.obs;
  final UserProvider userProvider = UserProvider();

  RxList<User> allUsers = <User>[].obs;

  RxString stringResult = "".obs;

  Future getAllUsers() async {
    isAccountLoading.value = true;
    final response = await userProvider.getAllUsers();
    isAccountLoading.value = false;
    stringResult.value = response.body.toString();
    if (response.statusCode == 200) {
      allUsers.value = User.fromJsonList(response.body);
    } else {
      Config().errorResponse(response);
    }
  }
}
