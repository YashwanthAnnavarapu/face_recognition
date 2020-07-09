//main.dart backup file

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HomeScreen",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Face Recognition App",),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: new SingleChildScrollView(
          child: new Container(
//                padding: EdgeInsets.fromLTRB(16, 16, 16,16),
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                new Container(
                  child:new Center(
                    child: new Container(
                      width: 250,
                      height: 250,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/search.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),

                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0,),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50),
                      new RaisedButton(
                        onPressed: hello,
                        child: new Text("Find",style: TextStyle(fontSize: 25.0,color: Colors.white,fontFamily: 'Georgia',fontStyle: FontStyle.italic),),
                        color: Colors.purple,
                        padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                      ),
                      SizedBox(height: 30),
                      new RaisedButton(
                        onPressed: hello,
                        child: new Text("New",style: TextStyle(fontSize: 25.0,color: Colors.white,fontFamily: 'Georgia',fontStyle: FontStyle.italic),),
                        color: Colors.purple,
                        padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void hello()
{}