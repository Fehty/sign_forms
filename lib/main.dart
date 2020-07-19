import 'package:flutter/material.dart';
import 'package:sign_forms/constants/text_theme.dart';
import 'package:sign_forms/forms/first_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Form',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: textTheme),
        home: FirstForm());
  }
}
