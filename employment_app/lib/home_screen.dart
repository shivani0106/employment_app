import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employment_app/services/database.dart';
import 'package:employment_app/style/Style.dart';
import 'package:employment_app/widgets/NavigationDrawer.dart';
import 'package:employment_app/widgets/home_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String userId;

class HomeScreen extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String inputData() {
    final User user = auth.currentUser;
    userId = user.uid.toString();
    return userId;
    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    print('Home uid:${inputData()}');
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().jobDetailsDisplay,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          //  automaticallyImplyLeading: false,
          title: Text('Job'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: JobsListView(),
      ),
    );
  }
}
