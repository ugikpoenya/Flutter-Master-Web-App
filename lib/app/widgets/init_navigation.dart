import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_web_app/app/routes/app_pages.dart';

import 'package:side_navigation/side_navigation.dart';

import 'package:get_storage/get_storage.dart';
import '../data/models/user_model.dart';

class initNavigation extends StatelessWidget {
  initNavigation({Key? key, required this.route_name}) : super(key: key);
  final box = GetStorage();
  final route_name;

  List<String> route_list = [
    Routes.HOME,
    Routes.ACCOUNT,
    Routes.SETTINGS,
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    if (box.read('isExpand') == null) box.write('isExpand', true);

    for (var i = 0; i < route_list.length; i++) {
      if (route_list[i] == route_name) {
        selected = i;
      }
    }

    return SideNavigationBar(
      theme: SideNavigationBarTheme(
        backgroundColor: Colors.black,
        itemTheme: ItemTheme(
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.blue,
        ),
        togglerTheme: TogglerTheme(
          expandIconColor: Colors.white,
          shrinkIconColor: Colors.white,
        ),
        showHeaderDivider: true,
        showMainDivider: true,
        showFooterDivider: true,
      ),
      selectedIndex: selected,
      initiallyExpanded: box.read('isExpand'),
      toggler: SideBarToggler(onToggle: () {
        box.write('isExpand', !box.read('isExpand'));
      }),
      footer: SideNavigationBarFooter(
        label: Text(
          "Ugikpoenya.net",
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      header: SideNavigationBarHeader(
        image: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/seed/picsum/200/300",
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(40)),
        ),
        title: Row(
          children: [
            Text(
              box.read('full_name'),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        subtitle: Text(box.read('email'),
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            )),
      ),
      items: const [
        SideNavigationBarItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
        ),
        SideNavigationBarItem(
          icon: Icons.person,
          label: 'Account',
        ),
        SideNavigationBarItem(
          icon: Icons.settings,
          label: 'Settings',
        ),
        SideNavigationBarItem(
          icon: Icons.logout,
          label: 'Logout',
        ),
      ],
      onTap: (index) {
        if (index < route_list.length) {
          Get.offAllNamed(route_list[index]);
        } else {
          box.write('token', '');
          box.write('full_name', '');
          box.write('email', '');
          Get.offAllNamed(Routes.LOGIN);
        }
      },
    );
  }
}
