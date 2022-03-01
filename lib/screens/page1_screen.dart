import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: StreamBuilder(
        stream: userService.streamCtrlUser,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? UserInformation(user: snapshot.data!)
              : const Center(
                  child: Text("There's no user information"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.usb_rounded),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
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
    return Container(
      width: double.infinity,
      height: double.infinity,
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
            'Proffesions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('proffesion'),
          ),
          const ListTile(
            title: Text('proffesion'),
          ),
          const ListTile(
            title: Text('proffesion'),
          ),
        ],
      ),
    );
  }
}
