////import 'dart:html';
////import 'package:file_picker/file_picker.dart';
////import 'package:flutter/material.dart';
////import 'dart:io';
////
////import 'package:http/http.dart' as http;
////void getData(url) async
////{
////  String token="token=1";
////  String task="&task=upload&image=";
//
//
//
//////  AssetImage image=Image.asset('assets/yashwanth.jpg') as AssetImage;
//////  File image= (await FilePicker.getFile()) as File;
////  var file=new File("assets/yashwanth.jpg");
////  print(url+token+task);
////  http.Response response=await http.get(url+token+task+file);
////  print(response.body);
////}
////
////void main()
////{
////  getData('http://127.0.0.1:5000/api?');
////}
//
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'dart:io';
//import 'package:path/path.dart';
//import 'package:dio/dio.dart';
//import 'package:file_picker/file_picker.dart';
//import 'package:http/http.dart' as http;
//void main()
//{
//  runApp(new MaterialApp(home: new flask()));
//}
//
//class flask extends StatefulWidget {
//  @override
//  _flaskState createState() => _flaskState();
//}
//
//class _flaskState extends State<flask> {
//  void upload() async
//  {
//    File _file=ImagePicker("S:/Personal FilesPrivate/Flutterface_recognition_app/assets/yashwanth.jpg") as File;
////    String name=basename(filepath.path);
//    FormData formData=new FormData.fromMap({
//      "token": "1",
//      "task":"upload",
////      "file":_file,
//    });
//    print("hello world");
////    http.Response response=await http.get(url+token+task+file);
////  print(response.body);
////    Response response = await htt().get("http://127.0.0.1:5000/api");
////    print(response);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Center(
//        child: new Container(
//          width: 100,
//          height: 30,
//          color: Colors.grey,
//          child: new FlatButton(
//              onPressed: upload,
//              child: new Text("Click Here"),
//
//          ),
//        )
//      )
//    );
//  }
//}
