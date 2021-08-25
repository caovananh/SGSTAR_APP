import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/CardHeader.dart';

import 'package:infixedu/utils/Utils.dart';

class RefundPage extends StatefulWidget {
  const RefundPage({key}) : super(key: key);

  @override
  State<RefundPage> createState() => RefundPageState();
}

class RefundPageState extends State<RefundPage>
    with SingleTickerProviderStateMixin {
  String name;

  String dropdownValue = 'Refund List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardHeader(child: Text('refunds'.toUpperCase())),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      textAlign: TextAlign.left),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Text(
                    'Refund information',
                    style: TextStyle(
                        color: Color(0xff13438f),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Color(0xFF9EDEFF))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          style: TextStyle(
                              color: Color(0xFF58595B),
                              fontWeight: FontWeight.bold),
                          icon: const Icon(Icons.keyboard_arrow_down_sharp),
                          iconSize: 24,
                          iconEnabledColor: Color(0xff13438f),
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Refund List',
                            'Refund reserves',
                            'Refund preferential fees ',
                            "Refund incentive SGSIS employees' children'",
                            "Other",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    width: double.infinity,
                   
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xFF9EDEFF))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Note'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s,',
                          style: TextStyle(color: Color(0xff13438f),fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Text(
                    'Refund information',
                    style: TextStyle(
                        color: Color(0xff13438f),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    width: double.infinity,
                   
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xFF9EDEFF))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Full name'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text('Lorem Ipsum ',
                          style: TextStyle(color: Color(0xff13438f),fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    width: double.infinity,
                   
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xFF9EDEFF))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ID'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text('123456 ',
                          style: TextStyle(color: Color(0xff13438f),fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    width: double.infinity,
                   
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xFF9EDEFF))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Class'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text('Lorem Ipsum ',
                          style: TextStyle(color: Color(0xff13438f),fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    width: double.infinity,
                   
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xFF9EDEFF))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Start learning'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text('DD/MM/YYYY ',
                          style: TextStyle(color: Color(0xff13438f),fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Text(
                    'Parent information',
                    style: TextStyle(
                        color: Color(0xff13438f),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                 Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    width: double.infinity,
                   
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xFF9EDEFF))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Full name'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text('Lorem Ipsum ',
                          style: TextStyle(color: Color(0xff13438f),fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),

                 Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    width: double.infinity,
                   
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xFF9EDEFF))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Email'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text('Lorem Ipsum ',
                          style: TextStyle(color: Color(0xff13438f),fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),

                 Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    width: double.infinity,
                   
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xFF9EDEFF))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Phone number'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          child: Text('Lorem Ipsum ',
                          style: TextStyle(color: Color(0xff13438f),fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                Center(
                  child: Text('Request will be sent to the school administration',
                  style: TextStyle(color: Color(0xffe4087e)),)
                ),

                Center(
                  child: ElevatedButton(         
                    onPressed: () {},
                    child: Text(
                      'refund'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff7cd3f7),
                      fixedSize: Size(120, 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6), // <-- Radius
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  String getName() {
    Utils.getStringValue('full_name').then((value) {
      setState(() {
        name = value;
      });
    });
    return name;
  }
}
