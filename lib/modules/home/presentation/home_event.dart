// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'home_bloc.dart';

abstract class HomeEvent {}

// Aqui são os eventos que eu tenho, geralmente se referem aos métodos...

class HomeFetchList extends HomeEvent {}

class HomeDeleteItemFromList extends HomeEvent {
  final User user;
  HomeDeleteItemFromList({
    required this.user,
  });
}
