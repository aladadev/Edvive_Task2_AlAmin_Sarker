import 'package:flutter/material.dart';
import 'package:spell_checker/spell_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spell Checker App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spell Checker'),
        ),
        body: SpellChecker(),
      ),
    );
  }
}
