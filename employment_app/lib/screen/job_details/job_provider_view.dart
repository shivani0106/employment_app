import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employment_app/home_screen.dart';
import 'package:employment_app/screen/profile/profile_display.dart';
import 'package:employment_app/style/Style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employment_app/demo.dart';
import 'job_details_view.dart';

//******************Variable for first name and mobile number */

String firstname = '';
String mobile = '';

//*************************Above variable */

class JobProviderView extends StatefulWidget {
  final String userId;
  JobProviderView(this.userId);

  @override
  _JobProviderViewState createState() => _JobProviderViewState();
}

class _JobProviderViewState extends State<JobProviderView> {
  @override
  Widget build(BuildContext context) {
    print('USerID: ${widget.userId}');
    // void displayAll() {
    //   for (var data in seeUsersFromFirebase.docs) {
    //     if (data.data()['UID'] == widget.userId) {
    //       firstname = (data.data()['First Name']);
    //       firstname = (data.data()['Phone Number']);
    //       break;
    //     }
    //   }
    // }

    return Scaffold(
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('UserDetails').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Text> names =[];

          for (var message in snapshot.data.docs) {
            if (message['UID'] == widget.userId) {
              firstname = message['First Name'];
              mobile = message['Phone Number'];

              final nameAdd = Text('First Name: $firstname');

              names.add(nameAdd);
              print('firstname: $firstname');
              print('mobile: $mobile');

              //Navigator.push(context, MaterialPageRoute(builder: (context)=> Demo(firstname: firstname,)));
            }
          }
          return Column(children: names);

        },
      ),
    );
  }
}
//         Container(
//           margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 85,
//                     backgroundColor: Colors.white,
//                     backgroundImage:
//                         AssetImage('lib/assets/images/user_avatar.png'),
//                   ),
//                 ],
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 20, top: 20),
//                   height: screenHeight(context) * 0.1,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                             text: 'First name: $firstname',
//                             style: largePrimaryColorsemiBold(),
//                             children: [
//                               TextSpan(
//                                   text: '', style: regularBlackColorRegular())
//                             ]),
//                       ),
//                       RichText(
//                         text: TextSpan(
//                             text: 'Mobile no: $mobile',
//                             style: largePrimaryColorsemiBold(),
//                             children: [
//                               TextSpan(
//                                   text: '', style: regularBlackColorRegular())
//                             ]),
//                       ),
//                     ],
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
