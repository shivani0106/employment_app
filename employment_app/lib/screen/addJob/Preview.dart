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
        child: Column(
          children: [
            Text(widget.fristName),
            Text(widget.lastName),
            Text(widget.mobileNo),
            Text(widget.email),
            Text(widget.address),
            Text(widget.jobType),
            Text(widget.discription),
            Text(widget.noOfPeople),
            Text(widget.time)
          ],
        ),
      ),
    );
  }
}
