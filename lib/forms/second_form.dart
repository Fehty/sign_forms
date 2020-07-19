import 'package:flutter/material.dart';

class SecondForm extends StatefulWidget {
  @override
  _SecondFormState createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Second form')), body: buildBody());
  }

  Widget buildBody() {
    return Container(color: Colors.blue);
  }
}
