import 'package:flutter/material.dart';

class GeneralInfo extends StatefulWidget {
  const GeneralInfo({key}) : super(key: key);

  @override
  _GeneralInfoState createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  bool _checkbox = false;
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  bool _checkbox6 = false;
  bool _checkbox7 = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          "CONFIDENTIAL\n ",
          style: TextStyle(
              fontSize: 16,
              color: Color(0Xff13438f),
              fontWeight: FontWeight.w800),
        ),
        Text(
            "The Vietnam Ministry of Health requires up-to-date information on the immunisation status of all residents in the country.\n \nAs well, the School has an obligation to ensure a safe and healthy emvironment for all students, faculty and staff.\n \n This Medical Report is required for all applications to Saigon Star International School. It must be complete and signed by a parent (front page); examined and signed by a doctor (back page) before the student attends classes or participates in any activities. Information is confidential and will only be used in case of an emergency.\n \n"),
        Text(
          "MEDICAL INSURANCE INFORMATION",
          style: TextStyle(
              fontSize: 16,
              color: Color(0Xff13438f),
              fontWeight: FontWeight.w800),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Color(0xff7cd3f7),
            ),
            child: Row(
              children: [
                Container(width: 150, child: Text('Medical Insurance')),
                Checkbox(
                  value: _checkbox,
                  onChanged: (value) {
                    setState(() {
                      _checkbox = !_checkbox;
                      _checkbox1 = !_checkbox;
                    });
                  },
                ),
                Text('Yes'),
                Checkbox(
                  value: _checkbox1,
                  onChanged: (value) {
                    setState(() {
                      _checkbox1 = !_checkbox1;
                      _checkbox = !_checkbox1;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Name of Insurance Provider:',
              labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
        TextFormField(
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Name of Policy Type(e.g. "Gold"):',
              labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
        TextFormField(
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Policy #:',
              labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
        TextFormField(
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Expiry Date:',
              labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            "MEDICAL AND AGREEMENTS",
            style: TextStyle(
                fontSize: 16,
                color: Color(0Xff13438f),
                fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Color(0xff7cd3f7),
                ),
                child: Checkbox(
                  value: _checkbox2,
                  onChanged: (value) {
                    setState(() {
                      _checkbox2 = !_checkbox2;
                    });
                  },
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                    'I/We agree for the following medications to be administered to my/our child if judged appropriate by the school clinic staff'),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Color(0xff7cd3f7),
                ),
                child: Checkbox(
                  value: _checkbox3,
                  onChanged: (value) {
                    setState(() {
                      _checkbox3 = !_checkbox3;
                    });
                  },
                ),
              ),
              Expanded(child: Text('PARACETAMOL (eg. tylenol and Panadol)')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Color(0xff7cd3f7),
                ),
                child: Checkbox(
                  value: _checkbox4,
                  onChanged: (value) {
                    setState(() {
                      _checkbox4 = !_checkbox4;
                    });
                  },
                ),
              ),
              Expanded(child: Text('IBUBROFEN')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Color(0xff7cd3f7),
                ),
                child: Checkbox(
                  value: _checkbox5,
                  onChanged: (value) {
                    setState(() {
                      _checkbox5 = !_checkbox5;
                    });
                  },
                ),
              ),
              Expanded(child: Text('THROAT LOZENGES')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Color(0xff7cd3f7),
                ),
                child: Checkbox(
                  value: _checkbox6,
                  onChanged: (value) {
                    setState(() {
                      _checkbox6 = !_checkbox6;
                    });
                  },
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                    'I/We agree that, in case of an emergency, the school is permitted to give medical attention and/or treatment to my child.'),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Color(0xff7cd3f7),
                ),
                child: Checkbox(
                  value: _checkbox7,
                  onChanged: (value) {
                    setState(() {
                      _checkbox7 = !_checkbox7;
                    });
                  },
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                    'I/We agree that, in case of an emergency, the school is permitted to give medical attention and/or treatment to my child and/or transfer my child to the appropriate medical center for futher investigation and treatment.'),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
