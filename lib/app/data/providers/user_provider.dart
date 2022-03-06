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
    print("userLogin");
    box.write("token", "");
    box.write("full_name", "");
    box.write("email", "");
    return await post(Config().BASE_URL + 'user/login', {
      "email": email,
      "password": password,
    });
  }

  Future getAllUsers() async {
    print("getAllUsers");
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

  Future postUser(Map<String, String?> body) async {
    print("postUser");
    return await post(Config().BASE_URL + 'users', body, headers: {
      "Authorization": (box.read("token") == null) ? '' : box.read("token")
    });
  }

  Future putUser(String userId, Map<String, String?> body) async {
    print("putUser");
    return await put(Config().BASE_URL + 'users/' + userId, body, headers: {
      "Authorization": (box.read("token") == null) ? '' : box.read("token")
    });
  }

  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
