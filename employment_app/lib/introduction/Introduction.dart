import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  Introduction({Key key}) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('Shivani',style: TextStyle(fontSize: 28),),
          )
        ],
      ),
    );
  }
}