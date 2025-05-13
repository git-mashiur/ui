import 'package:flutter/material.dart';
import 'form_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormPage(),
      theme: ThemeData.dark(),
    );
  }
}