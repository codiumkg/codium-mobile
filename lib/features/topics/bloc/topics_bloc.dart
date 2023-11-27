import 'package:codium/repositories/models/topic_data_model.dart';
import 'package:codium/repositories/topics/abstract_topics_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'topics_event.dart';
part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  TopicsBloc(this.topicsRepository) : super(TopicsInitial()) {
    on<TopicsEvent>((event, emit) async {
      if (event is LoadTopics) {
        try {
          emit(TopicsLoading());
          final topics = await topicsRepository.topics(event.sectionId);
          emit(TopicsSuccess(topics: topics));
        } catch (e) {
          emit(TopicsFailure(error: e));
        }
      }
    });
  }

  final AbstractTopicsRepository topicsRepository;
}
