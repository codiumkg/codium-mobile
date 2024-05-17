import 'package:codium/core/constants/style.dart';
import 'package:codium/features/topic_details/bloc/topic_details_bloc.dart';
import 'package:codium/features/topic_details/widgets/data_provider_inherit.dart';
import 'package:codium/features/topic_details/widgets/content_widget.dart';
import 'package:codium/features/topic_details/widgets/topic_content_selector_widget.dart';

import 'package:codium/repositories/topic_details/abstract_topic_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TopicDetailsScreen extends StatefulWidget {
  final int topicId;
  final String topicTitle;
  const TopicDetailsScreen(
      {super.key, required this.topicId, required this.topicTitle});

  @override
  State<TopicDetailsScreen> createState() => _TopicDetailsScreenState();
}

class _TopicDetailsScreenState extends State<TopicDetailsScreen> {
  var selectedTopic = 0;
  final _TopicDetailsBloc = TopicDetailsBloc(
    GetIt.I<AbstractTopicDetailsRepository>(),
  );
  @override
  void initState() {
    _TopicDetailsBloc.add(LoadTopicDetails(topicId: widget.topicId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topicTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.primaryTextColor),
        ),
        iconTheme: IconThemeData(color: CustomColors.primaryTextColor),
        centerTitle: true,
      ),
      body: BlocBuilder(
          bloc: _TopicDetailsBloc,
          builder: (context, state) {
            if (state is TopicDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TopicDetailsSuccess) {
              return DataProviderInheritedWidget(
                topicDetailsElement: state.topicDetails?[selectedTopic],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                          child: TopicContentSelectorWidget(
                            selectedTopicIndex: selectedTopic,
                            changeSelectedTopic: (i) {
                              selectedTopic = i;
                              setState(() {});
                            },
                            topicDetails: state.topicDetails,
                          ),
                        ),
                        IndexedStack(
                          index: selectedTopic,
                          children: state.topicDetails?.map((topicDetail) {
                                return ContentWidget(topicDetails: topicDetail);
                              }).toList() ??
                              [],
                        )
                      ]),
                ),
              );
            } else if (state is TopicDetailsFailure) {
              return Text(state.error.toString());
            } else {
              return const Text(
                'sdfsdfs',
                style: TextStyle(color: Colors.white),
              );
            }
          }),
    );
  }
}
