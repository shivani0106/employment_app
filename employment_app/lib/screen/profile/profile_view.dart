import 'package:employment_app/home_screen.dart';
import 'package:employment_app/screen/profile/image_picker/custom_image_picker.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfileView extends StatefulWidget {
  ProfileView(
      {this.fristName,
      this.lastName,
      this.mobileNo,
      this.email,
      this.address,
      });

  final String fristName;
  final String lastName;
  final String address;
  final String mobileNo;
  final String email;
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: Text('Profile'),
        ),
        body: WillPopScope(
            onWillPop: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen()),
                      (route) => false);
              //Navigator.pushNamedAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
            },
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    screenWidth(context) * 0.05,
                    screenHeight(context) * 0.05,
                    screenWidth(context) * 0.05,
                    screenHeight(context) * 0.05),
                height: screenHeight(context) * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                    //  margin: EdgeInsets.only(right: screenWidth(context)*0.1),
                      child: Center(child: CustomImagePicker()),
                    ),
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
//                RichText(
//                  text: TextSpan(
//                      text: 'Job type: ',
//                      style: largePrimaryColorsemiBold(),
//                      children: [
//                        TextSpan(
//                            text: '${widget.jobType}',
//                            style: regularBlackColorRegular())
//                      ]),
//                ),
//                RichText(
//                  text: TextSpan(
//                      text: 'Discription: ',
//                      style: largePrimaryColorsemiBold(),
//                      children: [
//                        TextSpan(
//                            text: '${widget.discription}',
//                            style: regularBlackColorRegular())
//                      ]),
//                ),
//                RichText(
//                  text: TextSpan(
//                      text: 'No of people : ',
//                      style: largePrimaryColorsemiBold(),
//                      children: [
//                        TextSpan(
//                            text: '${widget.noOfPeople}',
//                            style: regularBlackColorRegular())
//                      ]),
//                ),
//                RichText(
//                  text: TextSpan(
//                      text: 'Time: ',
//                      style: largePrimaryColorsemiBold(),
//                      children: [
//                        TextSpan(
//                            text: '${widget.time}',
//                            style: regularBlackColorRegular())
//                      ]),
//                ),
//                Center(child:
//                    FlatButton(
//                        color: primaryColor,
//                        onPressed: () => Navigator.pushAndRemoveUntil(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => HomeScreen()),
//                            (route) => false),
//                        child: Text(
//                          'Submit'.toUpperCase(),
//                          style: largewhiteColorBold(),
//                        ))
//                )
                  ],
                ),
              ),
            )));
  }
}