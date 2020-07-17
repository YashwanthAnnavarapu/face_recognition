import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facerecognitionapp/PickImage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String Name='';
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

  Future find() async
  {

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
      print(response);

      if(response.toString()!="3")
      {
        token=response.toString();
        var demo=Firestore.instance.collection("Details/YLUWLI1IhtWtaOziBxex/Person/");
        print(demo.getDocuments());
      }
//      else
//      {
//        Name='';
//        Occupation='';
//        Age='';
//        Gender='';
//        image=null;
//        token='';
//
//        _scaffoldKey.currentState.showSnackBar(
//            SnackBar(content: Text(response.toString()),
//              backgroundColor: Colors.purple,));
//        return;
//      }
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
                  padding: EdgeInsets.symmetric( vertical: 16.0,horizontal: 16.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                          )
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),



                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                  child: RaisedButton(
                    color: Colors.purple,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Text('Find',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                    ),
                    onPressed: find,
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


