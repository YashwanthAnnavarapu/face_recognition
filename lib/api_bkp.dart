import 'package:http/http.dart' as http;
import 'encrypt.dart';
import 'dart:convert';


Future getData(String base64) async
{
  String date = DateTime.now().toString();
  String token=createToken(date).toString();
  String task="upload";

  print(token);
  print(task);
  print(base64.substring(base64.length-10,base64.length));

  var response = await http.post(
    "https://test098.herokuapp.com/api",
    headers:{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "token": token,
      "task":task,
      "image":base64,
    }),
  );

//    var response = await http.get("https://test098.herokuapp.com/api");
//    data = json.decode(response.body);
//    print(data);
  print(response.body);
  print("hello world");
}


void main()
{
  getData("");
}

