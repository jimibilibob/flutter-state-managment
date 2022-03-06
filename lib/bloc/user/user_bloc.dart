import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:states/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));

    on<ChangeUserAge>((event, emit) {
      // print('ChangeUserAge called!!');
      if (!state.existsUser) return;

      emit(UserSetState(state.user!.copyWith(age: event.age)));
      // print('A new state will be emitted');
    });

    on<AddUserProfession>((event, emit) {
      // print('ChangeUserAge called!!');
      if (!state.existsUser) return;

      emit(UserSetState(state.user!.copyWith(
          professions: [...state.user!.professions, event.profession])));
      // print('A new state will be emitted!!');
    });

    on<RemoveUser>((event, emit) => emit(const UserInitialState()));
  }
}
