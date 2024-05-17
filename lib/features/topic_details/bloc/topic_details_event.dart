part of 'topic_details_bloc.dart';

abstract class TopicDetailsEvent {}

class LoadTopicDetails extends TopicDetailsEvent {
  final int topicId;

  LoadTopicDetails({required this.topicId});
}
