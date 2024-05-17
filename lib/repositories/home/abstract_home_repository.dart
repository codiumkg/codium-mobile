import 'package:codium/repositories/models/group_data_model.dart';
import 'package:codium/repositories/models/main_progress_data_model.dart';
import 'package:codium/repositories/models/section_data_model.dart';

abstract class AbstractHomeRepository {
  Future<Group?> group();
  Future<List<Section>?> section();
  Future<MainProgress?> mainProgress();
}
