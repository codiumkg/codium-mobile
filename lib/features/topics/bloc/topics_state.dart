part of 'topics_bloc.dart';

abstract class TopicsState {}

class TopicsInitial extends TopicsState {}

class TopicsLoading extends TopicsState {}

class TopicsSuccess extends TopicsState {
  final List<Topic>? topics;

  TopicsSuccess({required this.topics});
}

class TopicsFailure extends TopicsState {
  final dynamic error;

  TopicsFailure({required this.error});
}
