class Group {
  final int? id;
  final String? title;
  final Subject? subject;

  Group({this.id, this.title, this.subject});

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        subject = Subject.fromJson(json['subject']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subject': subject?.toJson(),
      };
}

class Subject {
  final int? id;
  final String? title;
  final String? image;

  Subject({this.id, this.title, this.image});

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
      };
}
