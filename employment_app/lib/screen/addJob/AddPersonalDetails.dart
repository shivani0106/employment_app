import 'package:employment_app/globals/Globals.dart';
import 'package:employment_app/globals/validation.dart';
import 'package:employment_app/screen/addJob/AddJobDetails.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';

class AddPersonalDetails extends StatefulWidget {
  AddPersonalDetails({Key key}) : super(key: key);

  @override
  _AddPersonalDetailsState createState() => _AddPersonalDetailsState();
}

class _AddPersonalDetailsState extends State<AddPersonalDetails> {
  final _formKeyDetails = GlobalKey<FormState>();
  //**********Nodes ******************************** */
  FocusNode fristnameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode mobileNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode addressNode = FocusNode();

  //***************Controllers**********************  */
  final _fristnameController = new TextEditingController();
  final _lastnameController = new TextEditingController();
  final _mobilenoController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Create Job'),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(
                screenWidth(context) * 0.05,
                screenHeight(context) * 0.03,
                screenWidth(context) * 0.05,
                screenHeight(context) * 0.03),
            child: Form(
                key: _formKeyDetails,
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //***************Frist Name**************************** */
                    TextFormField(
                      controller: _fristnameController,
                      focusNode: fristnameNode,
                      validator: validateName,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Frist Name',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: screenHeight(context) * 0.03),

                    //**************Last name****************************** */
                    TextFormField(
                        controller: _lastnameController,
                        focusNode: lastNameNode,
                        validator: validateName,
                        autofocus: false,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                        )),
                    SizedBox(height: screenHeight(context) * 0.03),
                    //***************Mobile Number **************** */

                    TextFormField(
                      controller: _mobilenoController,
                      focusNode: mobileNode,
                      validator: validateMobile,
                      autofocus: false,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefix: Text('$countryCode'),
                        labelText: 'Mobile Number',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: screenHeight(context) * 0.03),

                    //********************Email ***************** */
                    TextFormField(
                      controller: _emailController,
                      focusNode: emailNode,
                      validator: validateEmail,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: screenHeight(context) * 0.03),

                    //*****************Address ********************** */
                    TextFormField(
                      controller: _addressController,
                      focusNode: addressNode,
                      validator: validateAddress,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Address',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: screenHeight(context) * 0.03),

                    //******************Next Button*************** */
                    FlatButton(
                        color: primaryColor,
                        onPressed: () {
                          if (_formKeyDetails.currentState.validate()) {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => AddJobDetails(
//                                          fristName: _fristnameController.text,
//                                          lastName: _lastnameController.text,
//                                          mobileNo: _mobilenoController.text,
//                                          email: _emailController.text,
//                                          address: _addressController.text,
//                                        )));
                          }
                        },
                        child: Text(
                          'Next'.toUpperCase(),
                          style: largewhiteColorBold(),
                        ))
                  ],
                )))));
  }
}
