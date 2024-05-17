class MainProgress {
  final int? percent;

  MainProgress({this.percent});

  MainProgress.fromJson(Map<String, dynamic> json)
      : percent = json['percent'] as int?;

  Map<String, dynamic> toJson() => {
        'percent': percent,
      };
}
