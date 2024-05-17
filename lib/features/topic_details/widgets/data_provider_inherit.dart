import 'package:codium/repositories/models/topic_details_data_model.dart';
import 'package:flutter/material.dart';

class DataProviderInheritedWidget extends InheritedWidget {
  final TopicDetails? topicDetailsElement;

  const DataProviderInheritedWidget({
    Key? key,
    required Widget child,
    required this.topicDetailsElement,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(DataProviderInheritedWidget oldWidget) {
    return topicDetailsElement != oldWidget.topicDetailsElement;
  }
}
