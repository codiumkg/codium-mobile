import 'package:codium/core/constants/style.dart';
import 'package:codium/features/topic_details/widgets/answers_options_widget.dart';
import 'package:codium/repositories/models/topic_details_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class ContentWidget extends StatefulWidget {
  final TopicDetails? topicDetails;
  const ContentWidget({super.key, required this.topicDetails});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.topicDetails?.type == "LECTURE"
        ? Expanded(
            child: SingleChildScrollView(
                child: HtmlWidget(
              '${widget.topicDetails?.lecture?.content}',
              textStyle: TextStyle(color: CustomColors.primaryTextColor),
              factoryBuilder: () => MyWidgetFactory(),
            )),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "${widget.topicDetails?.task?.text}",
                style: AppFonts.s20W500
                    .copyWith(color: CustomColors.primaryTextColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const AnswersOptionsWidget()
            ],
          );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {
  // optional: override getter to configure how WebViews are built
  bool get webViewMediaPlaybackAlwaysAllow => true;
  String? get webViewUserAgent => 'My app';
}
