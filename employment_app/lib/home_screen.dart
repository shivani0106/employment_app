import 'package:employment_app/auth/authenticate.dart';
import 'package:employment_app/screen/job_details/job_details_view.dart';
import 'package:employment_app/style/Style.dart';
import 'package:employment_app/widgets/NavigationDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String userId;

class HomeScreen extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String inputData() {
    final User user = auth.currentUser;
    userId = user.uid.toString();
    return userId;
    // here you write the codes to input the data into firestore
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          //  automaticallyImplyLeading: false,
          title: Text('Job'),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobDetailsView())),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(screenWidth(context) * 0.02,
                          0, screenWidth(context) * 0.02, 0),
                      height: 150,
                      width: screenWidth(context),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    left: screenWidth(context) * 0.03),
                                child: Text(
                                  'Painter',
                                  style: largePrimaryColorsemiBold(),
                                )),
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  screenWidth(context) * 0.02,
                                  screenHeight(context) * 0.01,
                                  screenWidth(context) * 0.02,
                                  screenHeight(context) * 0.01),
                              child: Text(
                                ' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            GestureDetector(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.visibility, size: 20),
                                SizedBox(width: screenWidth(context) * 0.02),
                                Container(
                                    // decoration: BoxDecoration(color: primaryColor),
                                    padding: EdgeInsets.only(
                                        right: screenWidth(context) * 0.03),
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      'View',
                                      style: regularprimaryColorBold(),
                                    ))
                              ],
                            ))
                          ],
                        ),
                      )));
            }));
  }
}
