import 'package:codium/repositories/models/progress_data_model.dart';

class Section {
  final int? id;
  final String? title;
  final int? subjectId;
  final Progress? progress;

  Section({this.progress, this.id, this.title, this.subjectId});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json['id'] as int?,
        title: json['title'] as String?,
        subjectId: json['subjectId'] as int?,
        progress: Progress.fromJson(json['progress']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'progress': progress,
      };
}
