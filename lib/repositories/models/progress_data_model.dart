class Progress {
  final int? percent;

  Progress({this.percent});

  Progress.fromJson(Map<String, dynamic> json)
      : percent = json['percent'] as int?;

  Map<String, dynamic> toJson() => {
        'percent': percent,
      };
}
