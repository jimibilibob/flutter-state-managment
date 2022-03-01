import 'dart:async';

import 'package:states/models/user.dart';

class _UserService {
  late User _user;

  final StreamController<User> _streamCtrlUser =
      StreamController<User>.broadcast();

  User get user => _user;

  Stream<User> get streamCtrlUser => _streamCtrlUser.stream;

  set age(int age) {
    _user.age = age;
    _streamCtrlUser.add(_user);
  }

  set user(User user) {
    _user = user;
    _streamCtrlUser.add(_user);
  }

  dispose() {
    _streamCtrlUser.close();
  }
}

final userService = _UserService();
