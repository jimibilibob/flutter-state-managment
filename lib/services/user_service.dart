import 'package:flutter/cupertino.dart';
import 'package:states/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User? get usuario => _user;

  bool get userExists => (_user != null);

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  set age(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    _user!.proffesions.add('Profession ${_user!.proffesions.length + 1}');
    notifyListeners();
  }
}
