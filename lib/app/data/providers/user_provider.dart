import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../../Config.dart';

import 'package:master_web_app/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class UserProvider extends GetConnect {
  final box = GetStorage();

  Future userLogin(String email, String password) async {
    box.write("token", "");
    box.write("full_name", "");
    box.write("email", "");
    return await post(Config().BASE_URL + 'user/login', {
      "email": email,
      "password": password,
    });
  }

  Future getAllUsers() async {
    return await get(
      Config().BASE_URL + 'users',
      headers: {
        "Authorization": (box.read("token") == null) ? '' : box.read("token")
      },
    );
  }

  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
