import 'package:flutter/material.dart';

class HomeWorkList extends StatefulWidget {
  const HomeWorkList({key}) : super(key: key);

  @override
  _HomeWorkListState createState() => _HomeWorkListState();
}

class _HomeWorkListState extends State<HomeWorkList> {
  final items = List<String>.generate(10, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
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
                  title: Text('subject: Lorem ipsum'),
                  subtitle: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('TIme: 8/19/2021 10:42')),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Content: First Homework')
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Score:....')
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
    
  }

}