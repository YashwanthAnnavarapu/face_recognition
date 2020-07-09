import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(new ChatScreen());
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (ctx, index) =>Container(
            padding: EdgeInsets.all(8.0),
            child: Text('This Works..!'),
          ) ,
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
          onPressed:()
          {
            Firestore.instance
                .collection('chats/Xk6GFTBc5P0OfNdqTEW5/messages')
                .snapshots()
                .listen((data) {
                  data.documents.forEach((i) {
                    print(i['text']);
                  });
            });
          }
      ),
    );
  }
}
