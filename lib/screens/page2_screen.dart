import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dentro un metodo listen va en false, ya que no debe redibujar todo el build del Widget
    final userService = Provider.of<UserService>(context);

    return Scaffold(
        appBar: AppBar(
            title: Text(
                userService.userExists ? userService.usuario!.name : 'Page 2')),
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
                userService.user = User(name: 'Israel', age: 27, proffesions: [
                  "System's Engineering",
                  'E-Sport Professional Player'
                ]);
              },
            ),
            MaterialButton(
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userService.age = 24;
              },
            ),
            MaterialButton(
              child: const Text(
                'Add proffesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userService.addProfession();
              },
            )
          ],
        ));
  }
}
