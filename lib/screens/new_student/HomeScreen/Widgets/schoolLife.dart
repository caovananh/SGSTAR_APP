import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SchoolLife extends StatefulWidget {
  @override
  State<SchoolLife> createState() => SchoolLifeState();
}

class SchoolLifeState extends State<SchoolLife> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Welcome letter from Head of School",
                      style: TextStyle(
                        color: Color(0xFF144385),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text("Dear SGSIS Family,"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "I am immensely honored and excited to have been selected to serve as Head of School and as a leader of the Saigon Star International School Learning Star Family!"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "We are about to launch, with shared strategic aim, into the promising 2021/22 academic school year. Learning and our learners will consistently take center stage as we scaffold and sustain a robust and successful education foundation."),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "This strong base was established by the dedication and skills of Mr. James Quantrill, Ms. Fionnuala Brophy, the leaders before them, our caring, brilliant and professional SGSIS teachers, attuned LTAs and all experienced and devoted staff and our committed and collaborative school family members."),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "Thank you for this respected opportunity to briefly introduce myself as a well-experienced and appropriately qualified international education leader of inclusive learning. I am from the US state of New Hampshire and have worked in international education in eight countries for 27 years now. I am enjoying my tenth year living and learning in vivacious Vietnam, the place I happily call home."
    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "I have previously served international school family learners as a K-12 school principal and Head of School. I led diverse teams who successfully achieved shared goals through data-driven positive approaches to school improvement and learner achievement."),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "During this time, I have authentically developed beneficial global mindedness to consistently differentiate, as needed, to best support 21st-century unique learners ready to continue on to universities both at home and abroad and then later to successfully enter the workforce. I am adaptive, flexible, and often benefit from my sense of humor."),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "I look forward to greeting our excited star learners and extended family members most mornings at our school gate to ensure that we start our learning days with a genuine Smile!."
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "I very much look forward to seeing you 🤩 soon!"
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "Thomas R. Annis"
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                    child: Text(
                        "HEAD OF SCHOOL, M.Ed., B.S. Ed., AAGS"
                    ),
                  ),

                ],
                addAutomaticKeepAlives: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
