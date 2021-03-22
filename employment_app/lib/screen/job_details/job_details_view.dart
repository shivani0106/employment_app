import 'package:employment_app/screen/job_details/job_provider_view.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';

class JobDetailsView extends StatefulWidget {
  @override
  _JobDetailsViewState createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Job description'),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Title: ',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: 'sdsjdhkaj',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'No of pepole needed:',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: 'dshdkjshdjka00',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Hours:',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: 'dshdkjshdjka00',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Discription:',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: 'dshdkjshdjka00',
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Address:',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: 'dshdkjshdjka00',
                            style: regularBlackColorRegular())
                      ]),
                ),
                Center(
                    child: FlatButton(
                      color: primaryColor,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobProviderView())),
                        child: Text(
                          'Click to see Provider Details'.toUpperCase(),
                          style: largewhiteColorBold(),
                        )))
              ],
            ),
          ),
        ));
  }
}
