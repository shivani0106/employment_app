import 'package:flutter/material.dart';
import 'package:employment_app/style/Style.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNodeOne = FocusNode();
  FocusNode _focusNodeTwo = FocusNode();
  bool passwordVisiable;

  @override
  void initState() {
    super.initState();
    passwordVisiable = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: primaryColor),
          automaticallyImplyLeading: true,
          backgroundColor: whiteColor,
          title: Text(
            'Sign Up',
            style: largePrimaryColorBold(),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                height: 500,
                margin: EdgeInsets.only(
                    left: screenWidth(context) * 0.1,
                    right: screenWidth(context) * 0.1,
                    top: screenHeight(context) * 0.1,
                    bottom: screenHeight(context) * 0.1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       height: 40,
                      //       width: screenWidth(context) / 4,
                      //       child: Image.asset(
                      //         'lib/assets/images/appLogo.jpg',
                      //         fit: BoxFit.contain,
                      //       ),
                      //     ),
                      //     Container(
                      //       child: Text(
                      //         'Employment',
                      //         style: largePrimaryColorsemiBold(),
                      //       ),
                      //     )
                      //   ],
                      // ),

                      ///Mobile no ****************************************************************************
                      TextFormField(
                        validator: validateMobile,
                        autofocus: false,
                        focusNode: _focusNodeOne,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefix: Text("+91"),
                          labelText: 'Mobile No.',
                          labelStyle: _focusNodeOne.hasFocus
                              ? regularBlueColor()
                              : regulargreyColor(),
                          //  errorText: validateMobile.toString()
                        ),
                      ),

                      /// Password*************************************************************************************
                      TextFormField(
                        validator: validatePassword,
                        autofocus: false,
                        focusNode: _focusNodeTwo,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: passwordVisiable == true
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  passwordVisiable = !passwordVisiable;
                                });
                              }),
                          labelText: 'Password',
                          labelStyle: _focusNodeTwo.hasFocus
                              ? regularBlueColor()
                              : regulargreyColor(),
                        ),
                        obscureText: !passwordVisiable,
                      ),

                      ///Confirm Password*****************************************************************************

                      TextFormField(
                        validator: validatePassword,
                        autofocus: false,
                        focusNode: _focusNodeTwo,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: passwordVisiable == true
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  passwordVisiable = !passwordVisiable;
                                });
                              }),
                          labelText: 'Confirm Password',
                          labelStyle: _focusNodeTwo.hasFocus
                              ? regularBlueColor()
                              : regulargreyColor(),
                        ),
                        obscureText: !passwordVisiable,
                      ),

                      ///Forgot password***************************************************************************
                      // GestureDetector(
                      //   child: Container(
                      //     alignment: Alignment.centerRight,
                      //     child: Text(
                      //       'Forgot Password?',
                      //       style: smallPrimaryColorRegular(),
                      //     ),
                      //   ),
                      //   onTap: () => Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => ForgotPassword())),
                      // ),

                      /// Sign In button *************************************************************************
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          color: primaryColor,
                          textColor: whiteColor,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {}
                          },
                          child: Text(
                            'Sign Up',
                            style: regularwhiteColorBold(),
                          )),

                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'OR',
                            style: regularprimaryColorBold(),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            child: Image.asset('lib/assets/images/google.png',
                                fit: BoxFit.contain),
                          ),
                          Container(
                            height: 45,
                            width: 80,
                            child: Image.asset(
                                'lib/assets/images/facebookLogo.png',
                                fit: BoxFit.contain),
                          ),
                        ],
                      ),
                      GestureDetector(
                          onTap: () =>
                              Navigator.popAndPushNamed(context, '/signIn'),
                          child: Container(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Already have an account?',
                                    style: smallBlackColorRegular(),
                                    children: [
                                      TextSpan(
                                          text: 'Sign In',
                                          style: smallPrimaryColorSemiBold())
                                    ]),
                              )))
                    ],
                  ),
                ))));
  }

  ///mobile number validation***********************************************************************
  String validateMobile(String value) {
    if (value.length == 0) return "Enter mobile number";
    if (value.length != 10)
      return "Mobile number must be 10 digit";
    else
      return null;
  }

  ///Password validation ***************************************************************************
  String validatePassword(String value) {
    if (value.length == 0) return "Enter password number";
    if (value.length <= 6) {
      return "Password must be atleast 6 character";
    } else {
      return null;
    }
  }

  ///password matching******************************************************************************
}
