import 'package:codium/core/constants/style.dart';
import 'package:codium/repositories/models/topic_details_data_model.dart';
import 'package:flutter/material.dart';

class TopicContentSelectorWidget extends StatefulWidget {
  final int selectedTopicIndex;
  final List<TopicDetails>? topicDetails;
  final Function changeSelectedTopic;
  const TopicContentSelectorWidget(
      {super.key,
      required this.changeSelectedTopic,
      required this.topicDetails,
      required this.selectedTopicIndex});

  @override
  State<TopicContentSelectorWidget> createState() =>
      _TopicContentSelectorWidgetState();
}

class _TopicContentSelectorWidgetState
    extends State<TopicContentSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 70,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.topicDetails?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Material(
            borderRadius: BorderRadius.circular(30),
            color: index == widget.selectedTopicIndex
                ? CustomColors.primaryTextColor
                : CustomColors.secondaryTextColor,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                widget.changeSelectedTopic(index);
              },
              child: Container(
                height: 50,
                child: Center(
                  child: Text(index.toString()),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
