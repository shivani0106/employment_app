import 'package:employment_app/introduction/Introduction.dart';
import 'package:flutter/material.dart';
import 'package:employment_app/style/Style.dart';
import 'auth/SignUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: secondryBackColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Introduction(),
      initialRoute: '/',
      routes: {
        '/': (context) => Introduction(),
        '/signUp': (context) => SignUp()
      },
    );
  }
}
