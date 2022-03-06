import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Page2'),
          actions: [
            IconButton(
                onPressed: () {
                  userBloc.add(RemoveUser());
                },
                icon: const Icon(Icons.exit_to_app))
          ],
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
                final user = User(name: 'Israel', age: 27, professions: [
                  "System's Engineering",
                  'FullStack Developer'
                ]);
                userBloc.add(ActivateUser(user));
              },
            ),
            MaterialButton(
              child: const Text(
                'Set age',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAge(24));
              },
            ),
            MaterialButton(
              child: const Text(
                'Add profession',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddUserProfession('Senior'));
              },
            )
          ],
        ));
  }
}
