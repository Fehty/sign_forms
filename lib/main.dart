import 'package:flutter/material.dart';
import 'package:sign_forms/constants/text_theme.dart';
import 'package:sign_forms/forms/first_form.dart';

import 'dart:io' show Platform;

void main() => runApp(MyApp());

bool isMobile;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia)
        isMobile = true;
    } catch (e) {
      isMobile = false;
    }
    return MaterialApp(
        title: 'Flutter Form',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: textTheme),
        home: FirstForm());
  }
}
