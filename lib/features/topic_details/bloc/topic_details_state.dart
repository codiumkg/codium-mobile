part of 'topic_details_bloc.dart';


abstract class TopicDetailsState {}

class TopicDetailsInitial extends TopicDetailsState {}

class TopicDetailsLoading extends TopicDetailsState {}

class TopicDetailsSuccess extends TopicDetailsState {
  final List<TopicDetails>? topicDetails;

  TopicDetailsSuccess({required this.topicDetails});
}

class TopicDetailsFailure extends TopicDetailsState {
  final dynamic error;

  TopicDetailsFailure({required this.error});
}