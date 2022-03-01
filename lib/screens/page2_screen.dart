import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: userService.streamCtrlUser,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              return Text((snapshot.hasData) ? snapshot.data!.name : 'Page 2');
            },
          ),
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
                userService.user = User(
                    name: 'Israel ',
                    age: 27,
                    proffesions: ["System's Engineering"]);
              },
            ),
            MaterialButton(
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userService.age = 28;
              },
            ),
            MaterialButton(
              child: const Text(
                'Add proffesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            )
          ],
        ));
  }
}
