import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employment_app/screen/job_details/job_provider_view.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// List for fetching data from firebase
var jobTitle = [];
var jobDescription = [];
var numberOfPeople = [];
var hours = [];
var address = [];

class JobPostDetails extends StatelessWidget {
  final int count;
  final seeJobsFromFirebase;
  JobPostDetails({this.count, this.seeJobsFromFirebase});

  @override
  Widget build(BuildContext context) {
    print("seeJobsFromFirebase.docs:");

    for (var data in seeJobsFromFirebase.docs) {
      jobTitle.add(data.data()['Job Type']);
      jobDescription.add(data.data()['Job Description']);
      numberOfPeople.add(data.data()['Number of People']);
      hours.add(data.data()['Time']);
      address.add(data.data()['Job Address']);
    }
    print(jobTitle);
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
                            text: jobTitle[count],
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'No of pepole needed:',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: numberOfPeople[count],
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Hours:',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: hours[count],
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Description:',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: jobDescription[count],
                            style: regularBlackColorRegular())
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Address:',
                      style: largePrimaryColorsemiBold(),
                      children: [
                        TextSpan(
                            text: address[count],
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
