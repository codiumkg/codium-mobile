part of 'topics_bloc.dart';

abstract class TopicsEvent {}

class LoadTopics extends TopicsEvent {
  final int sectionId;

  LoadTopics({required this.sectionId});
}
