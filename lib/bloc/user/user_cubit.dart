import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialUser());

  void selectUser(User user) {
    emit(ActiveUser(user));
  }

  void setAge(int age) {
    final currentState = state;

    if (currentState is ActiveUser) {
      final newUser = currentState.user.copyWith(age: age);
      emit(ActiveUser(newUser));
    }
  }

  void addProffesion() {
    final currentState = state;

    if (currentState is ActiveUser) {
      final profList = [
        ...currentState.user.proffesions,
        'Profession ${currentState.user.proffesions.length + 1}'
      ];
      final newUser = currentState.user.copyWith(professionsList: profList);
      emit(ActiveUser(newUser));
    }
  }

  void deleteUser() {
    emit(InitialUser());
  }
}
