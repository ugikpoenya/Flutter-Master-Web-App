import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

import '../controllers/user_form_controller.dart';
import '../../../data/models/user_model.dart';
import 'package:dropdown_search/dropdown_search.dart';

class UserFormView extends GetView<UserFormController> {
  var user = User();

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      user = Get.arguments as User;
      controller.full_nameC.text = user.fullName!;
      controller.emailC.text = user.email!;
      controller.levelC = user.level!;
      controller.statusC = user.status!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text((user.fullName == null) ? "Add new" : user.fullName!),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.full_nameC,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Full Name",
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
                labelText: (user.fullName == null)
                    ? "Password"
                    : "Password, kosongkan bila tidak ingin di ubah",
                suffix: IconButton(
                  onPressed: () => controller.isPasswordHidden.toggle(),
                  icon: Icon(
                    Icons.remove_red_eye,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          DropdownSearch<String>(
            mode: Mode.MENU,
            items: ["Admin", "User"],
            onChanged: (val) {
              controller.levelC = val!;
            },
            dropdownSearchDecoration: InputDecoration(
              labelText: "Level",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
            ),
            selectedItem: controller.levelC,
          ),
          SizedBox(height: 20),
          DropdownSearch<String>(
            mode: Mode.MENU,
            items: ["Active", "Disable"],
            onChanged: (val) {
              controller.statusC = val!;
            },
            dropdownSearchDecoration: InputDecoration(
              labelText: "Status",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
            ),
            selectedItem: controller.statusC,
          ),
          SizedBox(height: 20),
          Obx(() => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    if (user.userId == null) {
                      controller.postUser();
                    } else {
                      controller.putUser(user.userId!);
                    }
                  }
                },
                child: Text(
                  controller.isLoading.isFalse ? "Save" : "Loading...",
                ),
              )),
        ],
      ),
    );
  }
}
