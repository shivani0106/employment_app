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
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(
                radius: 85,
                backgroundColor: Colors.white,
                backgroundImage:
                AssetImage('lib/assets/images/user_avatar.png'),
              ),
            ],),
          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
              height: screenHeight(context)*0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            RichText(
              text: TextSpan(
                  text: 'First name: ',
                  style: largePrimaryColorsemiBold(),
                  children: [
                    TextSpan(
                        text: '', style: regularBlackColorRegular())
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: 'Mobile no: ',
                  style: largePrimaryColorsemiBold(),
                  children: [
                    TextSpan(
                        text: '', style: regularBlackColorRegular())
                  ]),
            ),
          ],))

        ],),
      ),
    );
  }
}
