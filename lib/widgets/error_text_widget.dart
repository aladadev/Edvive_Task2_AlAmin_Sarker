import 'package:flutter/material.dart';
import 'package:language_tool/language_tool.dart';

class ErrorsWidgetText extends StatelessWidget {
  final WritingMistake writingMistake;
  const ErrorsWidgetText({Key? key, required this.writingMistake})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'IssueDescription',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(writingMistake.issueDescription.toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'IssueType',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(writingMistake.issueType.toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Message',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(writingMistake.message.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
