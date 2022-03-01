import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 2'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MaterialButton(
              child: const Text(
                'Set user',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final user = User(name: 'Israel', age: 26, proffesions: [
                  "System's Egineering",
                  'E-sports proffesional player'
                ]);
                userCubit.selectUser(user);
              },
            ),
            MaterialButton(
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userCubit.setAge(23);
              },
            ),
            MaterialButton(
              child: const Text(
                'Add proffesion',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userCubit.addProffesion();
              },
            )
          ],
        ));
  }
}
