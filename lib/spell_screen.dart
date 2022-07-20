import 'package:flutter/material.dart';
import 'package:language_tool/language_tool.dart';

class SpellChecker extends StatefulWidget {
  SpellChecker({Key? key}) : super(key: key);

  @override
  State<SpellChecker> createState() => _SpellCheckerState();
}

class _SpellCheckerState extends State<SpellChecker> {
  var tool = LanguageTool();
  List<WritingMistake> errors = [];
  final _spellController = TextEditingController();
  @override
  void dispose() {
    _spellController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: TextField(
              controller: _spellController,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              var errors = await tool.check(_spellController.text);
              errors.forEach((element) {
                errors.add(element);
                print(errors);
                setState(() {});
              });
            },
            icon: Icon(Icons.check_circle),
            label: Text('Check!'),
          ),
          Column(
            children: [
              ...errors
                  .map(
                    (e) => ListTile(title: Text(e.issueType.toString())),
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}
