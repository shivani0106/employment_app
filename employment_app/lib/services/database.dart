import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference addJobDetails =
      FirebaseFirestore.instance.collection('JobDetails');

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
}
