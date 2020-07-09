//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//void main()
//{
//  runApp(new MaterialApp(home: MyApp()));
//}
//
//class MyApp extends StatefulWidget {
//  final String title='Register Page';
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  @override
//  String Name;
//  String Occupation;
//  String Age;
//  String Gender;
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title:Text(widget.title),
//        centerTitle: true,
//      ),
//      body: new Center(
//        child: SingleChildScrollView(
//          child: new Column(
//            children: <Widget>[
//              SizedBox(
//                height: 80.0,
//              ),
//              CircleAvatar(
//                backgroundColor: Colors.red,
//                radius: 50.0,
//              ),
//              Padding(
//                padding: EdgeInsets.symmetric( vertical: 16.0,horizontal: 16.0),
//                child: Divider(),),
//
//              Padding(
//                padding: EdgeInsets.symmetric( vertical: 16.0,horizontal: 16.0),
//                child: TextField(
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.person),
//                    labelText: 'Name',
//                    enabledBorder: OutlineInputBorder(
//                      borderSide: BorderSide(
//                        color: Colors.blue,
//                      )
//                    ),
//                    border: OutlineInputBorder(),
//                  ),
//                  onChanged: (value)
//                  {
//                    setState(()
//                    {
//                      Name=value;
//                    });
//                  },
//                ),
//              ),
//
//              Padding(
//                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0,),
//                  child: TextField(
//                    decoration: InputDecoration(
//                      prefixIcon: Icon(Icons.business),
//                      labelText: 'Occupation',
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.blue,
//                        ),
//                      ),
//                      border: OutlineInputBorder(),
//                    ),
//                    onChanged: (value)
//                    {
//                      setState(()
//                      {
//                        Occupation=value;
//                      });
//                    },
//                  ),
//              ),
//
//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
//                child: TextField(
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.date_range),
//                    labelText: 'Age',
//                    enabledBorder: OutlineInputBorder(
//                      borderSide: BorderSide(
//                        color: Colors.blue,
//                      )
//                    ),
//                    border: OutlineInputBorder(),
//                  ),
//                  onChanged: (value)
//                  {
//                    setState(()
//                    {
//                      Age=value;
//                    });
//                  },
//                ),
//              ),
//
//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
//                child: TextField(
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.people),
//                    labelText: 'Gender',
//                    enabledBorder: OutlineInputBorder(
//                      borderSide: BorderSide(
//                        color: Colors.blue,
//                      ),
//                    ),
//                    border: OutlineInputBorder(),
//                  ),
//                  onChanged: (value)
//                  {
//                    setState(()
//                    {
//                      Gender=value;
//                    });
//                  },
//                ),
//              ),
//
//              Padding(
//                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
//                  child: MaterialButton(
//                    color: Colors.blue,
//                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
//                    child: Text('Register',
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 20,
//                      )
//                    ),
//                    onPressed: (){
//                      Firestore.instance.collection('/chats/oxE7DAFj89YpGyBnuyAj/messages')
//                          .snapshots().listen((data) {
//                            print(data);
//                      });
//                    },
//                  ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//void hello()
//{;}