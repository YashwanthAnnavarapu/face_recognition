import 'package:flutter/material.dart';

void main()
{
  runApp(new New());
}

class New extends StatefulWidget {
  final String title='Register Page';
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  String Name;
  String Occupation;
  String Age;
  String Gender;

  void hello()
  {
    if(Name!=null  && Occupation!=null && Age!=null && Gender!=null)
    {
      print(Name);
      print(Occupation);
      print(Age);
      print(Gender);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title:Text(widget.title),
          centerTitle: true,
        ),
        body: new Center(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[

                SizedBox(
                  height: 15.0,
                ),

                new Center(
                  child: new Container(
                    width: 200,
                    height: 200,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('assets/search.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height:15.0,
                ),

                Padding(
                  padding: EdgeInsets.symmetric( vertical: 16.0,horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value)
                    {
                      setState(()
                      {
                        Name=value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0,),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.business),
                      labelText: 'Occupation',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value)
                    {
                      setState(()
                      {
                        Occupation=value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      labelText: 'Age',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value)
                    {
                      setState(()
                      {
                        Age=value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.people),
                      labelText: 'Gender',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value)
                    {
                      setState(()
                      {
                        Gender=value;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Text('Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                    ),
                    onPressed: hello,
                  ),
                ) ,
              ],
            ),
          ),
        ),
    );
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: Container(
          child: new Center(
            child: new Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}



