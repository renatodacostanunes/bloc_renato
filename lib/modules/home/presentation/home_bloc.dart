// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renatin/modules/home/presentation/home_event.dart';
import 'package:renatin/modules/home/presentation/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late List<User> users;

  HomeBloc(initialState) : super(HomeStateEmpty()) {
    on<HomeDeleteItemFromList>((event, emit) async {
      await _deleteUser(emit, event.user);
    });
    on<HomeFetchList>((event, emit) async {
      await _getUsers(emit);
    });
  }

  Future<void> _getUsers(Emitter<HomeState> emit) async {
    emit(HomeStateLoading());
    await Future.delayed(const Duration(seconds: 4), () {
      users = List.generate(
          10,
          (index) => User(
              name: index % 2 == 0 ? "Renatin" : "Gustavo", age: index * 4));
    });
    emit(HomeStateSuccess(users: users));
  }

  Future<void> _deleteUser(Emitter<HomeState> emit, User user) async {
    emit(HomeStateLoading());
    users.removeWhere((element) => element.age == user.age);
    await Future.delayed(const Duration(seconds: 3), () {
      emit(HomeStateSuccess(users: users));
    });
  }
}

class User {
  final String name;
  final int age;
  User({
    required this.name,
    required this.age,
  });
}
