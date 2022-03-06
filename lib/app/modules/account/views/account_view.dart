import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

import '../controllers/account_controller.dart';
import '../../../widgets/init_navigation.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          initNavigation(
            route_name: Routes.ACCOUNT,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Add New"),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => ElevatedButton(
                        onPressed: () async {
                          controller.getAllUsers();
                        },
                        child: Text(
                          controller.isAccountLoading.isFalse
                              ? "Load data"
                              : "Loading...",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(
                  color: Colors.grey,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: controller.getAllUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Obx(() {
                        print(controller.allUsers.value.length);
                        return ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey[20],
                          ),
                          itemCount: controller.allUsers.value.length,
                          itemBuilder: ((context, index) {
                            var user = controller.allUsers.value[index];
                            return ListTile(
                              leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network(
                                  "https://picsum.photos/id/${index + 10}/100/100",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: Text(user.fullName!),
                              subtitle: Text(user.email!),
                              onTap: () {
                                print(user.fullName);
                              },
                            );
                          }),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
