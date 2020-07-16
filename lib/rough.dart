import 'dart:convert';
import 'package:facerecognitionapp/api_bkp.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
void main()
{
  runApp(new MaterialApp(home: new flask()));
}

class flask extends StatefulWidget {
  @override
  _flaskState createState() => _flaskState();
}

class _flaskState extends State<flask> {
  Future upload() async
  {

    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    List<int> imageBytes = image.readAsBytesSync();
    String base64Image= Base64Encoder().convert(imageBytes).toString();
    getData(base64Image);

//    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
            child: new Container(
              width: 100,
              height: 30,
              color: Colors.grey,
              child: new FlatButton(
                onPressed: upload,
                child: new Text("Click Here"),
              ),
            )
        )
    );
  }
}
