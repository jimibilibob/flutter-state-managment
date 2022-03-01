import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
        actions: [
          IconButton(
              onPressed: context.read<UserCubit>().deleteUser,
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      // el cubit y el initialState
      body: const _BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.usb_rounded),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class _BodyScaffold extends StatelessWidget {
  const _BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case InitialUser:
            return const Center(
              child: Text('No user information'),
            );

          case ActiveUser:
            return UserInformation(
              user: (state as ActiveUser).user,
            );
          default:
        }
        return const Center(child: Text('No recognized state'));

        // ANOTHER WAY USING IF STATEMENTS

        // if (state is InitialUser) {
        //   return const Center(
        //     child: Text('No user information'),
        //   );
        // }
        // if (state is ActiveUser) {
        //   return UserInformation(
        //     user: state.user,
        //   );
        // }
        // return const Center(child: Text('No recognized state'));
      },
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
            'Proffesions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...user.proffesions
              .map((profession) => ListTile(
                    title: Text(profession),
                  ))
              .toList()
        ],
      ),
    );
  }
}
