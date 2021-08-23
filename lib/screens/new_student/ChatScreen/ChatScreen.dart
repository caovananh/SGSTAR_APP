import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('This is chat screen', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
