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

  void add_new_person()
  {
    String date = DateTime.now().toString();
    token=createToken(date);

    if(Name!=''  && Occupation!='' && Age!='' && Gender!='')
    {
      if(image==null)
      {
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text('Please Upload the Image'),
              backgroundColor: Colors.purple,));
        return;
      }


      var image_url = FirebaseStorage.instance.ref().child('user_image').child(token+'.jpg');
      image_url.putFile(image);

      var ref=Firestore.instance.collection('Details/YLUWLI1IhtWtaOziBxex/Person').document(token);
      ref.setData({
        'Name': Name,
        'Occupation': Occupation,
        'Age': Age,
        'Gender': Gender,
        'image':token,
      });


//      ref.add({
//      'Name': Name,
//      'Occupation': Occupation,
//      'Age': Age,
//      'Gender': Gender,
//      'image':token,
//        });
    Name='';
    Occupation='';
    Age='';
    Gender='';
    image=null;
    token='';
    showAlertDialog(context);
  }
    else
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Please Fill the Form Details'),
        backgroundColor: Colors.purple,));
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
                    onChanged: (value)
                    {
                      setState(()
                      {
                        Name=value.trim();
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0,),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.business),
                      labelText: 'Occupation',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value)
                    {
                      setState(()
                      {
                        Occupation=value.trim();
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      labelText: 'Age',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                          )
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value)
                    {
                      setState(()
                      {
                        Age=value.trim();
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.people),
                      labelText: 'Gender',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value)
                    {
                      setState(()
                      {
                        Gender=value.trim();
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                  child: RaisedButton(
                    color: Colors.purple,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Text('Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                    ),
                    onPressed: add_new_person,
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


