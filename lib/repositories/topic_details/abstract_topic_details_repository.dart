import 'package:codium/repositories/models/topic_details_data_model.dart';

abstract class AbstractTopicDetailsRepository {
  Future<List<TopicDetails>?> topicDetails(int topicId);
}
