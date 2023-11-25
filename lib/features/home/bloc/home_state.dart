part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final Group? group;
  final List<Section>? sections;

  HomeSuccess({required this.group, required this.sections});
}

class HomeFailure extends HomeState {
  final dynamic error;

  HomeFailure({required this.error});
}
