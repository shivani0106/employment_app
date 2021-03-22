import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';

class JobProviderView extends StatefulWidget {
  @override
  _JobProviderViewState createState() => _JobProviderViewState();
}

class _JobProviderViewState extends State<JobProviderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Provider Details'),
      ),
    );
  }
}
