import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../encrypt.dart';

  Future upload(String base64,String task,String token) async
  {
//    String date = DateTime.now().toString();
//    String token = createToken(date).toString();

    var response = await http.post(
      "https://test098.herokuapp.com/api",
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "token": token,
        "task": task,
        "image": base64,
      }),
    );

    print(response.body);
    Map data = json.decode(response.body);
    print(data["msg"]);
    String statusCode = data["msg"].toString();


    if (statusCode == "-1")
      return "Image Consists of Multiple Faces";
    else if (statusCode == "-2")
      return "Image Does not have a person";
    else if (statusCode == "1") {
      return "1";
    }
    else if (statusCode == "2")
      return "Details are Already Captured..!";
    else
      return "OOP's There is a Problem";
  }

  Future search(String base64,String task) async
  {
    var response = await http.post(
      "https://test098.herokuapp.com/api",
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "token": "",
        "task": task,
        "image": base64,
      }),
    );

    print(response.body);
    Map data = json.decode(response.body);
    print(data["msg"]);
    String statusCode = data["msg"].toString();

    if (statusCode == "3")
      return data['token'].toString();
    else if (statusCode == "4")
      return "No Match Found or Details not Registered";
    else
      return "OOP's There is a Problem";

  }
