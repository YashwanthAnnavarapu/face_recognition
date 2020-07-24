import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facerecognitionapp/PickImage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'PickImage.dart';
import 'HomePage.dart';
import 'encrypt.dart';
import 'dart:convert';
import 'API/Call_API.dart' as api;

void main()
{
  runApp(new MaterialApp(
      title: 'New Person',
      home:new New()
  ));
}

class New extends StatefulWidget {
  final String title='Register Page';
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  String Name;
  String Occupation='';
  String Age='';
  String Gender='';
  File image=null;
  String token='';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _pickedImage(File image)
  {
    this.image=image;
  }


  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Status :"),
      content: Text("Successfully Registered"),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future firebase() async
  {
    var document=Firestore.instance.collection("Details/YLUWLI1IhtWtaOziBxex/Person").document(token).collection(token).getDocuments();
    document.then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        if(result.documentID.toString()==token) {
          return result.data["Name"];
        }
      });
    });
  }

  Future Search() async
  {
    String name,occupation,age,gender;

      if(image==null)
      {
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text('Please Upload the Image'),
              backgroundColor: Colors.purple,));
        return;
      }


      List<int> imageBytes = image.readAsBytesSync();
      String base64Image= Base64Encoder().convert(imageBytes).toString();
//      print(base64Image.substring(base64Image.length-5,base64Image.length));
      String response=await api.search(base64Image,"find");
//      print(response);
      token=response.toString();

      if(response.toString()!="3")
      {
        var document=Firestore.instance.collection("Details/YLUWLI1IhtWtaOziBxex/Person").document(token).collection(token).getDocuments();
        document.then((querySnapshot) {
          querySnapshot.documents.forEach((result) {
            String temp=result.documentID.toString();

            if(temp==token) {
              Name= result.data["Name"];
              Occupation= result.data["Occupation"];
              Age= result.data["Age"];
              Gender= result.data["Gender"];
              Navigator.push(
                this.context,
                MaterialPageRoute(
                    builder: (context)=>Display(
                        token: token,
                        name: Name,
                        occupation: Occupation,
                        age: Age,
                        gender: Gender
                    )),);
//            print(result.data["Name"]);
//            print(Name+Occupation+Age+Gender);
            }
          });
        });
      }
      else
      {
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(response.toString()),
              backgroundColor: Colors.purple,));
        return;
      }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title:Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: new Center(
        child: SingleChildScrollView(
          child: Form(
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),


                new Center(
                  child: PickImage(_pickedImage),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50,horizontal: 16.0),
                  child: RaisedButton(
                    color: Colors.purple,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Text('Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                    ),
                    onPressed: Search,
                  ),
                ) ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Display extends StatelessWidget {

  String token;
  String name;
  String occupation;
  String age;
  String gender;
  Display({Key key, @required this.token,@required this.name,@required this.occupation,@required this.age,@required this.gender})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: new AppBar(
          title: Text("ProFile"),
          titleSpacing: 25,
          backgroundColor: Colors.purple,
        ),
        body:new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Container(
                width: 200,
                height: 250,
//                color:Colors.black,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/facerecognitionapp-2caa4.appspot.com/o/user_image%2F"+token+".jpg?alt=media&token=470ad3cc-aa54-4b03-b75d-00ef94c0b4d9",
//                  loadingBuilder: new ,
                ),
              ),

              new Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: new TextField(
                        enabled: false,
                        decoration: new InputDecoration(
                          labelText: name,
                          prefixIcon: new Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: new TextField(
                        enabled: false,
                        decoration: new InputDecoration(
                          labelText: occupation,
                          prefixIcon: new Icon(Icons.business),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: new TextField(
                        enabled: false,
                        decoration: new InputDecoration(
                          labelText: age,
                          prefixIcon: new Icon(Icons.date_range),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: new TextField(
                        enabled: false,
                        decoration: new InputDecoration(
                          labelText: gender,
                          prefixIcon: new Icon(Icons.people),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
