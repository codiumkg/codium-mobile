
import 'package:codium/repositories/models/topic_details_data_model.dart';
import 'package:codium/repositories/topic_details/abstract_topic_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'topic_details_event.dart';
part 'topic_details_state.dart';

class TopicDetailsBloc extends Bloc<TopicDetailsEvent, TopicDetailsState> {
  TopicDetailsBloc(this.topicDetailsRepository) : super(TopicDetailsInitial()) {
    on<TopicDetailsEvent>((event, emit) async {
      if (event is LoadTopicDetails) {
        try {
          emit(TopicDetailsLoading());
          final topics = await topicDetailsRepository.topicDetails(event.topicId);
          emit(TopicDetailsSuccess(topicDetails: topics));
        } catch (e) {
          emit(TopicDetailsFailure(error: e));
        }
      }
    });
  }

  final AbstractTopicDetailsRepository topicDetailsRepository;
}
