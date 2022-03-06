import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/models/user.dart';
import 'package:states/screens/user_controller.dart';
// import 'package:states/screens/page2_screen.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Obx(() => userCtrl.existsUser.value
          ? UserInformation(user: userCtrl.user.value)
          : const Center(
              child: Text('No user Information'),
            )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.usb_rounded),
        onPressed: () {
          // Get.to(const Page2Screen());
          Get.toNamed('page2', arguments: {'name': 'Israel', 'age': 24});
        },
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // width: double.infinity,
      // height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Name: ${user.name}'),
          ),
          ListTile(
            title: Text('age: ${user.age}'),
          ),
          const Text(
            'professions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...user.professions
              .map((profession) => ListTile(
                    title: Text(profession),
                  ))
              .toList()
        ],
      ),
    );
  }
}
