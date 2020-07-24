import 'package:flutter/material.dart';

void main()
{
  runApp(new MaterialApp(home:new Display(),));
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


//                    Padding(
//                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                      child: new TextField(
//                        enabled: false,
//                        decoration: new InputDecoration(
//                          labelText: "Occupation",
//                          prefixIcon: new Icon(Icons.person),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Colors.purple,
//                            ),
//                          ),
//                          border: OutlineInputBorder(),
//                        ),
//                      ),
//                    ),
//
//
//                    Padding(
//                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                      child: new TextField(
//                        enabled: false,
//                        decoration: new InputDecoration(
//                          labelText: "Age",
//                          prefixIcon: new Icon(Icons.person),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Colors.purple,
//                            ),
//                          ),
//                          border: OutlineInputBorder(),
//                        ),
//                      ),
//                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

//class Display extends StatefulWidget {
//  @override
//  _DisplayState createState() => _DisplayState();
//}

//class _DisplayState extends State<Display> {
//  String token;
//  String name;
//  String occupation;
//  String age;
//  String gender;
//  Display({Key key, @required this.token,@required this.name,@required this.occupation,@required this.age,@required this.gender})
//      :super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    return Scaffold(
//        appBar: new AppBar(
//          title: Text("ProFile"),
//          titleSpacing: 25,
//          backgroundColor: Colors.purple,
//        ),
//        body:new Center(
//          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              new Container(
//                width: 200,
//                height: 250,
////                color:Colors.black,
//                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                child: Image.network(
//                  "https://firebasestorage.googleapis.com/v0/b/facerecognitionapp-2caa4.appspot.com/o/user_image%2F"+token+".jpg?alt=media&token=470ad3cc-aa54-4b03-b75d-00ef94c0b4d9",
////                  loadingBuilder: new ,
//                ),
//              ),
//
//              new Container(
//                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Padding(
//                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                      child: new TextField(
//                        enabled: false,
//                        decoration: new InputDecoration(
//                          labelText: name,
//                          prefixIcon: new Icon(Icons.person),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(
//                              color: Colors.purple,
//                            ),
//                          ),
//                          border: OutlineInputBorder(),
//                        ),
//                      ),
//                    ),
//
//
////                    Padding(
////                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
////                      child: new TextField(
////                        enabled: false,
////                        decoration: new InputDecoration(
////                          labelText: "Occupation",
////                          prefixIcon: new Icon(Icons.person),
////                          enabledBorder: OutlineInputBorder(
////                            borderSide: BorderSide(
////                              color: Colors.purple,
////                            ),
////                          ),
////                          border: OutlineInputBorder(),
////                        ),
////                      ),
////                    ),
////
////
////                    Padding(
////                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
////                      child: new TextField(
////                        enabled: false,
////                        decoration: new InputDecoration(
////                          labelText: "Age",
////                          prefixIcon: new Icon(Icons.person),
////                          enabledBorder: OutlineInputBorder(
////                            borderSide: BorderSide(
////                              color: Colors.purple,
////                            ),
////                          ),
////                          border: OutlineInputBorder(),
////                        ),
////                      ),
////                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        )
//    );
//  }
//}