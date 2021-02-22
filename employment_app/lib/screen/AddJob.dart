import 'package:flutter/material.dart';

class AddJob extends StatefulWidget {
  AddJob({Key key}) : super(key: key);

  @override
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: Text('Add job'),
    )));
  }
}
