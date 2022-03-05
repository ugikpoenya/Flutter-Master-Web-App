import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 40),
          Center(
            child: Text(
              "Login",
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller.emailC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => TextField(
              controller: controller.passwordC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                suffix: IconButton(
                  onPressed: () => controller.isPasswordHidden.toggle(),
                  icon: Icon(
                    Icons.remove_red_eye,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(() => ElevatedButton(
                onPressed: () {
                  if (controller.isLoginLoading.isFalse) {
                    controller.login();
                  }
                },
                child: Text(
                  controller.isLoginLoading.isFalse ? "Login" : "Loading...",
                ),
              )),
          SizedBox(height: 20),
          Text("Demo : "),
          Text("email : admin@admin.com"),
          Text("pass : admin"),
        ],
      ),
    );
  }
}
