import 'package:employment_app/home_screen.dart';
import 'package:employment_app/style/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ForgotPassword.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final String countryCode = '+91';
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNodeOne = FocusNode();
  FocusNode _focusNodeTwo = FocusNode();
  bool passwordVisiable;
  bool showSpinner = false;

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  // Phone verification function

  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential result;
  Future<bool> loginUser(String phone, BuildContext context) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();
        // Automatic verification of phone number
        result = await _auth.signInWithCredential(credential);
        User user = result.user;

        //Navigator PUSH to HomeScreen() in home_screen.dart

        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(user: user),
            ),
          );
        } else {
          print('Error');
        }
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception);
      },
      codeSent: (String verficationId, [int forceResendingToken]) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text('Enter OTP'),
              content: Column(
                children: [
                  TextField(
                    controller: _codeController,
                  )
                ],
              ),
              actions: [
                FlatButton(
                  child: Text('Confirm'),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () async {
                    final String code = _codeController.text.trim();
                    AuthCredential credential = PhoneAuthProvider.credential(
                        smsCode: code, verificationId: verficationId);
                    UserCredential result =
                        await _auth.signInWithCredential(credential);
                    User user = result.user;

                    //Navigator PUSH to HomeScreen() in home_screen.dart

                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(user: user),
                        ),
                      );
                    } else {
                      print('Error');
                    }
                  },
                )
              ],
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //Google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );

    // Once signed in, return the UserCredential
    result = await _auth.signInWithCredential(credential);

    return result;
  }

  void signOutUser() {
    _auth.signOut();
  }

  //Facebook
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

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
            'Sign In',
            style: largePrimaryColorBold(),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
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
                          controller: _phoneController,
                          focusNode: _focusNodeOne,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefix: Text("$countryCode   "),
                            labelText: 'Mobile No.',
                            labelStyle: _focusNodeOne.hasFocus
                                ? regularBlueColor()
                                : regulargreyColor(),
                            //  errorText: validateMobile.toString()
                          ),
                        ),

                        /// Password*************************************************************************************
                        // TextFormField(
                        //   validator: validatePassword,
                        //   autofocus: false,
                        //   focusNode: _focusNodeTwo,
                        //   decoration: InputDecoration(
                        //     suffixIcon: IconButton(
                        //         icon: passwordVisiable == true
                        //             ? Icon(Icons.visibility)
                        //             : Icon(Icons.visibility_off),
                        //         onPressed: () {
                        //           setState(() {
                        //             passwordVisiable = !passwordVisiable;
                        //           });
                        //         }),
                        //     labelText: 'Password',
                        //     labelStyle: _focusNodeTwo.hasFocus
                        //         ? regularBlueColor()
                        //         : regulargreyColor(),
                        //   ),
                        //   obscureText: !passwordVisiable,
                        // ),

                        // ///Forgot password***************************************************************************
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
                            // if (_formKey.currentState.validate()) {

                            // }
                            setState(() {
                              showSpinner = true;
                            });
                            final phoneNumber =
                                countryCode + _phoneController.text.trim();
                            print(phoneNumber);
                            loginUser(phoneNumber, context);
                            setState(() {
                              showSpinner = false;
                            });
                          },
                          child: Text(
                            'Sign In',
                            style: regularwhiteColorBold(),
                          ),
                        ),

                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              'OR',
                              style: regularprimaryColorBold(),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: signInWithGoogle,
                              child: Container(
                                height: 50,
                                width: 100,
                                child: Image.asset(
                                    'lib/assets/images/google.png',
                                    fit: BoxFit.contain),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                signInWithFacebook();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 45,
                                width: 80,
                                child: Image.asset(
                                    'lib/assets/images/facebookLogo.png',
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              print(_auth.currentUser);

                              signOutUser();
                              print('Sign out');
                              print(_auth.currentUser);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Don\'t have an account?',
                                      style: smallBlackColorRegular(),
                                      children: [
                                        TextSpan(
                                            text: 'Sign Out',
                                            style: smallPrimaryColorSemiBold())
                                      ]),
                                )))
                      ],
                    ),
                  ))),
        ));
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
}
