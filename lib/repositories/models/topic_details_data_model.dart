import 'package:codium/repositories/models/topic_data_model.dart';

enum Type {
  // ignore: constant_identifier_names
  LECTURE,
  // ignore: constant_identifier_names
  TASK
}

class TopicDetails {
  final int? id;
  final Type? type;
  final int? orderNumber;
  final int? taskId;
  final int? lectureId;
  final int? topicId;
  final Topic? topic;
  final Lecture? lecture;
  final Task? task;

  TopicDetails(this.id, this.type, this.orderNumber, this.taskId,
      this.lectureId, this.topicId, this.topic, this.lecture, this.task);

  TopicDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as Type?,
        orderNumber = json['orderNumber'] as int?,
        taskId = json['taskId'] as int?,
        lectureId = json['lectureId'] as int?,
        topicId = json['topicId'] as int?,
        topic = Topic.fromJson(json['topic']),
        lecture = Lecture.fromJson(json['lecture']),
        task = Task.fromJson(json['task']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'orderNumber': orderNumber,
        'taskId': taskId,
        'lectureId': lectureId,
        'topicId': topicId,
        'topic': topic,
        'lecture': lecture,
        'task': task,
      };
}

class Lecture {
  final int? id;
  final String? title;
  final String? content;
  final int? number;
  final String? image;
  final int? topicId;
  final bool? isCompleted;

  Lecture(this.topicId, this.isCompleted, this.id, this.title, this.content,
      this.number, this.image);

  Lecture.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        content = json['content'] as String?,
        number = json['number'] as int?,
        image = json['image'] as String?,
        topicId = json['topicId'] as int?,
        isCompleted = json['isCompleted'] as bool;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'number': number,
        'image': image,
        'topicId': topicId,
        'isCompleted': isCompleted
      };
}

class Task {
  final int? id;
  final String? text;
  final String? image;
  final String? tip;
  final int? topicId;

  Task(this.text, this.tip, this.topicId, this.id, this.image);

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        text = json['text'] as String?,
        image = json['image'] as String?,
        tip = json['tip'] as String?,
        topicId = json['topicId'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'image': image,
        'tip': tip,
        'topicId': topicId,
      };
}
