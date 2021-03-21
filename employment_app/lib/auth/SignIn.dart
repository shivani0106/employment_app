import 'package:employment_app/globals/Globals.dart';
import 'package:employment_app/globals/validation.dart';
import 'package:employment_app/home_screen.dart';
import 'package:employment_app/style/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNodeOne = FocusNode();

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
                mainAxisSize: MainAxisSize.min,
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

  Stream<User> get user {
    return _auth.authStateChanges();
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
      backgroundColor: backprimaryColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: screenHeight(context) * 0.05,
                        left: screenWidth(context) * 0.04),
                    color: primaryColor,
                    height: screenHeight(context) * 0.6,
                    child: Column(
                      children: [
                        Container(
                          child:
                              Text('WELCOME', style: extralargeWhiteSemiBold()),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                right: screenWidth(context) * 0.1),
                            child: Text(
                              'To Employement Seeking App',
                              style: largeWhiteSemiBold(),
                            )),
                      ],
                    ),
                  ),
                  Container(height: screenHeight(context) * 0.4),
                ]),
          ),
          Container(
            alignment: Alignment.center,
            child: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: SingleChildScrollView(
                child: Container(
                  height: screenHeight(context) * 0.45,
                  margin: EdgeInsets.only(
                      left: screenWidth(context) * 0.1,
                      right: screenWidth(context) * 0.1,
                      top: screenHeight(context) * 0.1,
                      bottom: screenHeight(context) * 0.1),
                  padding: EdgeInsets.only(
                      left: screenWidth(context) * 0.01,
                      right: screenWidth(context) * 0.01,
                      top: screenHeight(context) * 0.01,
                      bottom: screenHeight(context) * 0.01),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///Mobile no ****************************************************************************
                          Container(
                            width: screenWidth(context) * 0.7,
                            margin: EdgeInsets.only(
                                left: screenWidth(context) * 0.02,
                                right: screenWidth(context) * 0.02),
                            child: TextFormField(
                              validator: validateMobile,
                              autofocus: false,
                              controller: _phoneController,
                              focusNode: _focusNodeOne,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefix: Text("$countryCode "),
                                labelText: 'Mobile No.',
                                labelStyle: _focusNodeOne.hasFocus
                                    ? regularBlueColor()
                                    : regulargreyColor(),
                                //  errorText: validateMobile.toString()
                              ),
                            ),
                          ),

                          /// Sign In button *************************************************************************
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            color: primaryColor,
                            textColor: whiteColor,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
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
                              }
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
                          // GestureDetector(
                          //     onTap: () {
                          //       print(_auth.currentUser);

                          //       signOutUser();
                          //       print('Sign out');
                          //       print(_auth.currentUser);
                          //     },
                          //     child: Container(
                          //         alignment: Alignment.center,
                          //         child: RichText(
                          //           text: TextSpan(
                          //               text: 'Don\'t have an account?',
                          //               style: smallBlackColorRegular(),
                          //               children: [
                          //                 TextSpan(
                          //                     text: 'Sign Out',
                          //                     style:
                          //                         smallPrimaryColorSemiBold())
                          //               ]),
                          //         )))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
