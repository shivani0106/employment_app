import 'package:employment_app/auth/SignIn.dart';
import 'package:employment_app/globals/validation.dart';
import 'package:employment_app/home_screen.dart';
import 'package:employment_app/screen/Profile.dart';
import 'package:employment_app/screen/addJob/AddPersonalDetails.dart';
import 'package:employment_app/widgets/createDrawerBodyItems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'createDrawerHeader.dart';
import 'package:fluttertoast/fluttertoast.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        CreateDrawerHeader(),
        craeteDrawerBodyItems(
            icons: Icons.add,
            text: 'Add Job',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddPersonalDetails()))),
        craeteDrawerBodyItems(
            icons: Icons.view_array,
            text: 'Find Job',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen()))),
        craeteDrawerBodyItems(
            icons: Icons.people,
            text: 'Profile',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()))),
        craeteDrawerBodyItems(
            icons: Icons.login,
            text: 'Sign In',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()))),
        craeteDrawerBodyItems(
            icons: Icons.logout,
            text: 'Sign Out',
            onTap: () {
              if (_auth.currentUser != null) {
                signOut();
                Navigator.pop(context);
              } else {
                Fluttertoast.showToast(
                    msg: 'You are already logout please login',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM_LEFT,
                    backgroundColor: Colors.black,
                    textColor: Colors.white);
              }
            }),
        Divider(),
        Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text('App version 1.0.0'))
      ],
    ));
  }
}
