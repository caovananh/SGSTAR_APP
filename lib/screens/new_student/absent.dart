import 'package:flutter/material.dart';

class AbsentScreen extends StatefulWidget {
  const AbsentScreen({key}) : super(key: key);
  @override
  _AbsentScreenState createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              child: new Text(
                "ABSENT",
                style: new TextStyle(
                  color: Color(0Xff13438f),
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                color: Color(0xff7cd3f7),
              ),
              padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "LIST OF COURSES",
                  style: new TextStyle(
                    color: Color(0Xff13438f),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(width: 150, child: Text('16/08/2021')),
                Checkbox(
                  value: _checkbox,
                  onChanged: (value) {
                    setState(() {
                      _checkbox = !_checkbox;
                    });
                  },
                ),
                Text('Absent'),
                Checkbox(
                  value: _checkbox,
                  onChanged: (value) {
                    setState(() {
                      _checkbox = !_checkbox;
                    });
                  },
                ),
                Text('Present'),
              ],
            ),
          ),
          Row(
            children: [
              Container(width: 150, child: Text('17/08/2021')),
              Checkbox(
                value: _checkbox,
                onChanged: (value) {
                  setState(() {
                    _checkbox = !_checkbox;
                  });
                },
              ),
              Text('Absent'),
              Checkbox(
                value: _checkbox,
                onChanged: (value) {
                  setState(() {
                    _checkbox = !_checkbox;
                  });
                },
              ),
              Text('Present'),
            ],
          ),
          Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Color(0xff7cd3f7), width: 2.0)),
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 15),
                child: TextField(
                  style: TextStyle(color: Colors.black45),
                  maxLines: 8,
                  decoration: InputDecoration.collapsed(
                      hintText: "Reason Absent",
                      hintStyle:
                          TextStyle(fontSize: 14.0, color: Color(0xffd8d8d8))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Attach file',
                    style: TextStyle(color: Color(0xff13438f), fontSize: 16)),
              ],
            ),
          ),
          Card(
            color: Color(0xffe4087e),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              )),
              onPressed: null,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
