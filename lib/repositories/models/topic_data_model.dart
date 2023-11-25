class Topic {
  final int? id;
  final String? title;
  final int? sectionId;

  Topic({required this.id, required this.title, required this.sectionId});

  Topic.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        sectionId = json['sectionId'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'sectionId': sectionId,
      };
}
