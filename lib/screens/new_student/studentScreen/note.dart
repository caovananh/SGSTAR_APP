import 'package:flutter/material.dart';
import 'package:infixedu/screens/new_student/CommonWidgets/AppBarWidget.dart';
import 'package:infixedu/screens/new_student/studentScreen/note_detail.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({key}) : super(key: key);
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  void initState() {
    super.initState();
  }

  Color color = Color(0xff13438f);
  int _selected = null;
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(3, (index) => null);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              child: new Text(
                "notification".toUpperCase(),
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
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Card(
                    color: Color(0xffebf6ff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0),
                        isThreeLine: true,
                        leading: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF7dd3f7),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                          ),
                          width: 35,
                          height: 30,
                          child: Center(
                              child: Text(
                            '1',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "notification".toUpperCase(),
                              style: TextStyle(
                                  color: Color(0xff13438f),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                '25/12/2021',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'),
                            ),
                            TextButton(
                                onPressed: () {
                                  _noteDetails(index);
                                },
                                child: Text(
                                  'Read more',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: _selected == index ? Colors.red: color),
                                ))
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }

  void _noteDetails(int index) {
    setState(() {
      _selected = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteDetail()),
    );
  }
}
