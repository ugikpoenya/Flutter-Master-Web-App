import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

import 'package:master_web_app/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class UserProvider extends GetConnect {
  Future userLogin(String email, String password) async {
    final box = GetStorage();
    box.write("token", "");
    box.write("full_name", "");
    box.write("email", "");

    final response = await post('https://api.ugikpoenya.net/user/login', {
      "email": email,
      "password": password,
    });
    print(response.body);

    if (response.statusCode == 200) {
      box.write("token", response.body['token']);
      User user = User.fromJson(response.body['user']);
      box.write('full_name', user.fullName);
      box.write('email', user.email);

      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar(
        "Error",
        "Invalid email or password",
        backgroundColor: Colors.red,
      );
    }
  }

  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
