import 'package:get/get.dart';
import 'package:states/models/user.dart';

class UserController extends GetxController {
  var existsUser = false.obs;
  var user = User().obs;

  get professionsCount => user.value.professions.length;

  void loadUser(User newUser) {
    existsUser.value = true;
    user.value = newUser;
  }

  void changeAge(int age) {
    user.update((val) {
      val!.age = age;
    });
  }

  void addProfession(String newProfession) {
    user.update((val) {
      val!.professions = [...val.professions, newProfession];
    });
  }
}
