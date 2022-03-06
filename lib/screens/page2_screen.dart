import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:states/models/user.dart';
import 'package:states/screens/user_controller.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments['name']);
    final userCtrl = Get.find<UserController>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Page2'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text(
                'Set user',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final newUser = User(name: 'Israel', age: 24, professions: [
                  "System's Egineering",
                  'FullStack Developer'
                ]);
                userCtrl.loadUser(newUser);
                Get.snackbar(
                  'User set',
                  'Israel is the user name',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    const BoxShadow(color: Colors.black38, blurRadius: 1),
                  ],
                );
              },
            ),
            MaterialButton(
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userCtrl.changeAge(23);
              },
            ),
            MaterialButton(
              child: const Text(
                'Add profession',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userCtrl.addProfession(
                    'Profession #${userCtrl.professionsCount + 1}');
              },
            ),
            MaterialButton(
              child: const Text(
                'Change Theme',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
            )
          ],
        ));
  }
}
