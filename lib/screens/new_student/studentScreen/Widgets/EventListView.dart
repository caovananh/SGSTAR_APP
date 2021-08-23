import 'package:flutter/material.dart';

class EventListView extends StatefulWidget {
  const EventListView({key}) : super(key: key);

  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  final items = List<String>.generate(10, (i) => "Item $i");
  int i = 0;
  void initState() {
    super.initState();
    print(items);
  }

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
                  title: Text('Event name'),
                  subtitle: Text('TIme: 25/12/2021 14:30')),
            ),
          );
        },
      ),
    );
  }
}
