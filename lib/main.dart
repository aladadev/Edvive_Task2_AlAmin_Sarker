import 'package:flutter/material.dart';
import 'package:spell_checker/spell_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      title: 'Spell Checker App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Spell Checker'),
        ),
        body: SpellChecker(),
      ),
    );
  }
}
