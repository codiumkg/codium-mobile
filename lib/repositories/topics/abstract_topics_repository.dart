import 'package:codium/repositories/models/topic_data_model.dart';

abstract class AbstractTopicsRepository {
  Future<List<Topic>?> topics(int sectionId);
}
