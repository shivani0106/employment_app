import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employment_app/screen/findJob/filterJob.dart';
import 'package:employment_app/services/database.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindJobView extends StatefulWidget {
  @override
  _FindJobViewState createState() => _FindJobViewState();
}

class _FindJobViewState extends State<FindJobView> {
  //*******************type of job******************//

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().jobDetailsDisplay,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Find Job'),
            backgroundColor: primaryColor,
          ),
          body: FilterJob()),
    );
  }
}
