import 'package:flutter/material.dart';
import 'package:language_tool/language_tool.dart';
import 'package:spell_checker/widgets/error_text_widget.dart';

class SpellChecker extends StatefulWidget {
  SpellChecker({Key? key}) : super(key: key);

  @override
  State<SpellChecker> createState() => _SpellCheckerState();
}

class _SpellCheckerState extends State<SpellChecker> {
  var tool = LanguageTool();
  List<WritingMistake> errors = [];
  final _spellController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    _spellController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          helperText: 'Enter a sentence here to check!',
                          helperStyle: const TextStyle()),
                      textAlign: TextAlign.center,
                      controller: _spellController,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        errors = await tool.check(_spellController.text);
                        setState(() {
                          _isLoading = false;
                        });
                        // errors.forEach((element) {
                        //   print(errors);
                        // });
                      } catch (error) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                content: Text(error.toString()),
                              );
                            });
                        print(error);
                        throw error;
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    icon: Icon(Icons.check_circle),
                    label: Text('Check!'),
                  ),
                  Container(
                    child: Column(
                      children: errors
                          .map((e) => ErrorsWidgetText(
                                writingMistake: e,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
