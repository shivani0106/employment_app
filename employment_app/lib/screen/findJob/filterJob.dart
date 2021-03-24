import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employment_app/screen/profile/AddPersonalDetails.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';

import 'package:employment_app/globals/Globals.dart';
import 'package:employment_app/home_screen.dart';
import 'package:employment_app/my_packages/custom_country_state_city.dart';
import 'package:provider/provider.dart';
import '../../home_screen.dart';

String selectTypeOfJob;
String selectTime;
String countryValue;
String stateValue;
String cityValue;
int flag = 0;

var jobTitle = [];
var jobDescription = [];
var numberOfPeople = [];
var hours = [];
var address = [];

class FilterJob extends StatefulWidget {
  @override
  _FilterJobState createState() => _FilterJobState();
}

class _FilterJobState extends State<FilterJob> {
  final _formFindJob = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final seeJobsFromFirebase = Provider.of<QuerySnapshot>(context);
    print("seeUsersFromFirebase.docs:");
    print(seeJobsFromFirebase.docs.length);
    print('uid = $uid');

    for (var data in seeJobsFromFirebase.docs) {
      if (typeOfJob == data.data()['Job Type'] &&
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
      } else {
        flag = 1;
      }
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            screenWidth(context) * 0.05,
            screenHeight(context) * 0.03,
            screenWidth(context) * 0.05,
            screenHeight(context) * 0.03),
        child: Form(
          key: _formFindJob,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                'Type of Job',
                style: regularPrimaryColorSemiBold(),
              )),
              SizedBox(
                height: screenHeight(context) * 0.005,
              ),
              DropdownButtonFormField(
                isExpanded: true,
                iconDisabledColor: Colors.black,
                iconEnabledColor: primaryColor,
                hint: Text('Select type of job'),
                value: selectTypeOfJob,
                items: typeOfJob.map((e) {
                  return DropdownMenuItem(value: e, child: new Text(e));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectTypeOfJob = newValue;
                  });
                },
                validator: (value) => value == null ? "Please select" : null,
              ),
              SizedBox(
                height: screenHeight(context) * 0.035,
              ),
              Container(
                child: Text(
                  'Working hours',
                  style: regularPrimaryColorSemiBold(),
                ),
              ),
              SizedBox(
                height: screenHeight(context) * 0.005,
              ),
              DropdownButtonFormField(
                isExpanded: true,
                iconDisabledColor: Colors.black,
                iconEnabledColor: primaryColor,
                hint: Text('Select time'),
                value: selectTime,
                items: time.map((e) {
                  return DropdownMenuItem(value: e, child: new Text(e));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectTime = newValue;
                  });
                },
                validator: (value) => value == null ? "Please select" : null,
              ),
              SizedBox(
                height: screenHeight(context) * 0.035,
              ),
              CustomSelectState(
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
              SizedBox(
                height: screenHeight(context) * 0.035,
              ),
              Center(
                child: FlatButton(
                  color: primaryColor,
                  onPressed: () {
                    if (_formFindJob.currentState.validate()) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    }
                  },
                  child: Text(
                    'Submit'.toUpperCase(),
                    style: largewhiteColorBold(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
