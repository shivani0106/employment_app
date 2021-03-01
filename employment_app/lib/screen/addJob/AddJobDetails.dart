import 'package:employment_app/globals/validation.dart';
import 'package:employment_app/screen/addJob/Preview.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';

class AddJobDetails extends StatefulWidget {
  AddJobDetails(
      {this.fristName, this.lastName, this.mobileNo, this.email, this.address});

  final String fristName;
  final String lastName;
  final String address;
  final String mobileNo;
  final String email;
  @override
  _AddJobDetailsState createState() => _AddJobDetailsState();
}

class _AddJobDetailsState extends State<AddJobDetails> {
  final _formJobDetails = GlobalKey<FormState>();
  //**********************Nodes******************************************** */
  FocusNode jobType = FocusNode();
  FocusNode jobDiscription = FocusNode();

  //*********************Controller *******************************************
  final _typeOFJobController = new TextEditingController();
  final _discriptionController = new TextEditingController();

  //***************************No of people needed */
  List<String> noOfPeople = ['1', '2', '3', '4', '5', '5 to 10', 'Above 10'];
  String selectPeople = '1';

  //*************************Time ******************** */
  List<String> time = [
    '1 to 2 hour',
    '2 to 5 hour',
    '5 to 8 hour',
    '10 to 12 hours',
    '1 Day',
    '2 Day',
    'More than 2 Days'
  ];
  String selectTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Create Job'),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.fromLTRB(
              screenWidth(context) * 0.05,
              screenHeight(context) * 0.03,
              screenWidth(context) * 0.05,
              screenHeight(context) * 0.03),
          child: Form(
              key: _formJobDetails,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //**************************Type of job************************ */
                  TextFormField(
                    controller: _typeOFJobController,
                    focusNode: jobType,
                    validator: validateJob,
                    autofocus: false,
                    autocorrect: true,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(labelText: 'Type of Job'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.03,
                  ),
                  //**************Select No of Peopple*************** */
                  Container(
                    child: Text('Select No of People'),
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.01,
                  ),
                  DropdownButton(
                      isExpanded: true,
                      iconDisabledColor: Colors.black,
                      iconEnabledColor: primaryColor,
                      hint: Text('Select No of People'),
                      value: selectPeople,
                      items: noOfPeople.map((e) {
                        return DropdownMenuItem(value: e, child: new Text(e));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectPeople = newValue;
                        });
                      }),
                  //******************Select Time************************* */
                  SizedBox(
                    height: screenHeight(context) * 0.03,
                  ),
                  Container(
                    child: Text('Select Time'),
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.01,
                  ),
                  DropdownButton(
                      isExpanded: true,
                      iconDisabledColor: Colors.black,
                      iconEnabledColor: primaryColor,
                      hint: Text('Select Time'),
                      value: selectTime,
                      items: time.map((e) {
                        return DropdownMenuItem(value: e, child: new Text(e));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectTime = newValue;
                        });
                      }),

                  SizedBox(
                    height: screenHeight(context) * 0.03,
                  ),
                  //************************Job Discription********************** */
                  TextFormField(
                    controller: _discriptionController,
                    focusNode: jobDiscription,
                    autofocus: false,
                    autocorrect: true,
                    decoration: InputDecoration(labelText: 'Job Discription'),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.03,
                  ),
                  FlatButton(
                      color: primaryColor,
                      onPressed: () {
                        if (_formJobDetails.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Preview(
                                        fristName: widget.fristName,
                                        lastName: widget.lastName,
                                        mobileNo: widget.mobileNo,
                                        email: widget.email,
                                        address: widget.address,
                                        jobType: _typeOFJobController.text,
                                        discription:
                                            _discriptionController.text,
                                        noOfPeople: selectPeople,
                                        time: selectTime,
                                      )));
                        }
                      },
                      child: Text(
                        'Submit'.toUpperCase(),
                        style: largewhiteColorBold(),
                      ))
                ],
              )),
        )));
  }
}
