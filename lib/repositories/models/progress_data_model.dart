class Progress {
  final int? toComplete;
  final int? completed;

  Progress({required this.toComplete, required this.completed});

  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        toComplete: json['toComplete'] as int?,
        completed: json['completed'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'toComplete': toComplete,
        'completed': completed,
      };
}
