class Section {
  final int? id;
  final String? title;
  final int? subjectId;

  Section({this.id, this.title, this.subjectId});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subjectId: json['subjectId'] as int?);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
