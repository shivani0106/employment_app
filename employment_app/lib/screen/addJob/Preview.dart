import 'package:employment_app/home_screen.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  Preview(
      {this.fristName,
      this.lastName,
      this.mobileNo,
      this.email,
      this.address,
      this.jobType,
      this.discription,
      this.noOfPeople,
      this.time});

  final String fristName;
  final String lastName;
  final String address;
  final String mobileNo;
  final String email;
  final String jobType;
  final String discription;
  final String noOfPeople;
  final String time;
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: Text('Preview'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(
                screenWidth(context) * 0.05,
                screenHeight(context) * 0.05,
                screenWidth(context) * 0.05,
                screenHeight(context) * 0.05),
            height: screenHeight(context) * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Frist name: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.fristName}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Last name: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.lastName}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Mobile no: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.mobileNo}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Email: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.email}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Address: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.address}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Job type: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.jobType}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Discription: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.discription}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'No of people : ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.noOfPeople}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Time: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: '${widget.time}',
                            style: regularBlackColorRegular())
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                        color: primaryColor,
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Edit'.toUpperCase(),
                          style: largewhiteColorBold(),
                        )),
                    FlatButton(
                        color: primaryColor,
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (route) => false),
                        child: Text(
                          'Submit'.toUpperCase(),
                          style: largewhiteColorBold(),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
