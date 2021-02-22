import 'package:firebase_auth/firebase_auth.dart';

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

FirebaseAuth _auth = FirebaseAuth.instance;

void signOut() {
  _auth.signOut();
  print(_auth.currentUser);
  print('you are sucessfull signOut');
}
