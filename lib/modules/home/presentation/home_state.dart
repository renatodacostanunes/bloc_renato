// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:renatin/modules/home/presentation/home_bloc.dart';

abstract class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateSuccess extends HomeState {
  final List<User> users;
  HomeStateSuccess({
    required this.users,
  });
}

class HomeStateFailure extends HomeState {
  final String message;
  HomeStateFailure({
    required this.message,
  });
}
