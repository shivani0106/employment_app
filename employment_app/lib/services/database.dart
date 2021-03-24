import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference addJobDetails =
      FirebaseFirestore.instance.collection('JobDetails');

  final CollectionReference addUserDetails =
      FirebaseFirestore.instance.collection('UserDetails');

//********************Update and create Database for Job details****************/
  Future updateAddJobDetails({
    String uid,
    String jobType,
    String numberOfPeople,
    String time,
    String state,
    String country,
    String city,
    String jobAddress,
    String jobDescription,
    int pincode,
  }) async {
    return await addJobDetails.doc().set({
      'UID': uid,
      'Job Type': jobType,
      'Number of People': numberOfPeople,
      'Time': time,
      'Country': country,
      'State': state,
      'City': city,
      'Job Address': jobAddress,
      'Job Description': jobDescription,
      'Pincode': pincode
    });
  }

//********************Get add job detail from database****************/

  Stream<QuerySnapshot> get jobDetailsDisplay {
    return addJobDetails.snapshots();
  }

//********************Get add user profile from database****************/
  Stream<QuerySnapshot> get userDetailsDisplay {
    return addUserDetails.snapshots();
  }

//************************ Storing user profile in Database***********/
  Future updateAddUserDetails({
    String uid,
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String address,
  }) async {
    return await addUserDetails.doc().set({
      'UID': uid,
      'First Name': firstName,
      'Last Name': lastName,
      'Email': email,
      'Address': address,
      'Phone Number': phoneNumber
    });
  }
}
