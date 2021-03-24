import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employment_app/screen/job_details/job_details_view.dart';
import 'package:employment_app/screen/profile/AddPersonalDetails.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';

import 'package:employment_app/globals/Globals.dart';
import 'package:employment_app/home_screen.dart';
import 'package:employment_app/my_packages/custom_country_state_city.dart';
import 'package:provider/provider.dart';
import '../../home_screen.dart';

int flag = 0;

var jobTitle = [];
var jobDescription = [];
var numberOfPeople = [];
var hours = [];
var address = [];

class FilterJob extends StatelessWidget {
  final String selectTypeOfJob;
  final String selectTime;
  final String countryValue;
  final String stateValue;
  final String cityValue;

  FilterJob({
    this.selectTime,
    this.cityValue,
    this.countryValue,
    this.selectTypeOfJob,
    this.stateValue,
  });

  @override
  Widget build(BuildContext context) {
    final seeJobsFromFirebase = Provider.of<QuerySnapshot>(context);
    print("seeUsersFromFirebase.docs:");
    print(seeJobsFromFirebase.docs.length);
    print('uid = $uid');

    for (var data in seeJobsFromFirebase.docs) {
      if (selectTypeOfJob == data.data()['Job Type'] &&
          selectTime == data.data()['Time'] &&
          countryValue == data.data()['Country'] &&
          stateValue == data.data()['State'] &&
          cityValue == data.data()['City']) {
        // adding jobs in list
        jobTitle.add(data.data()['Job Type']);
        jobDescription.add(data.data()['Job Description']);
        numberOfPeople.add(data.data()['Number of People']);
        hours.add(data.data()['Time']);
        address.add(data.data()['Job Address']);
      }
    }
    if (jobTitle.isEmpty) {
      print('No data Found');
    }
    return ListView.builder(
        itemCount: jobTitle.length,
        itemBuilder: (BuildContext context, int i) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JobDetailsView(
                  count: i,
                  seeJobsFromFirebase: seeJobsFromFirebase,
                ),
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(screenWidth(context) * 0.02, 0,
                  screenWidth(context) * 0.02, 0),
              height: 150,
              width: screenWidth(context),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding:
                            EdgeInsets.only(left: screenWidth(context) * 0.03),
                        child: Text(
                          jobTitle[i],
                          style: largePrimaryColorsemiBold(),
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth(context) * 0.02,
                          screenHeight(context) * 0.01,
                          screenWidth(context) * 0.02,
                          screenHeight(context) * 0.01),
                      child: Text(
                        jobDescription[i],
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.visibility, size: 20),
                          SizedBox(width: screenWidth(context) * 0.02),
                          Container(
                              // decoration: BoxDecoration(color: primaryColor),
                              padding: EdgeInsets.only(
                                  right: screenWidth(context) * 0.03),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'View',
                                style: regularprimaryColorBold(),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
