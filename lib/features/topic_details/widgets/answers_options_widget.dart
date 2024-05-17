import 'package:codium/core/constants/style.dart';
import 'package:flutter/material.dart';

class AnswersOptionsWidget extends StatefulWidget {
  const AnswersOptionsWidget({super.key});

  @override
  State<AnswersOptionsWidget> createState() => _AnswersOptionsWidgetState();
}

enum Answers { option1, option2 }

class _AnswersOptionsWidgetState extends State<AnswersOptionsWidget> {
  Answers? _answer = Answers.option1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          groupValue: _answer,
          title: Text(
            'Azims Mom',
            style:
                AppFonts.s20W500.copyWith(color: CustomColors.primaryTextColor),
          ),
          value: Answers.option1,
          onChanged: (value) {
            setState(() {
              _answer = value;
            });
          },
        ),
        RadioListTile(
          title: Text(
            "programming language",
            style:
                AppFonts.s20W500.copyWith(color: CustomColors.primaryTextColor),
          ),
          groupValue: _answer,
          value: Answers.option2,
          onChanged: (value) {
            setState(() {
              _answer = value;
            });
          },
        )
      ],
    );
  }
}
