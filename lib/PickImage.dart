import 'dart:io';
//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  @override
  _PickImageState createState() => _PickImageState();

  PickImage(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;
}

class _PickImageState extends State<PickImage> {
  File _pickedImage;


  void imagepicker() async {
    // ignore: deprecated_member_use
    final _pickedImageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = _pickedImageFile;
    });
    widget.imagePickFn(_pickedImageFile);
  }



  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Container(
          width: 200,
          height: 250,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: _pickedImage!=null?FileImage(_pickedImage):AssetImage('assets/search.png'),
                fit: BoxFit.fill
            ),
          ),
        ),

        FlatButton.icon(
            textColor: Colors.purple,
            onPressed: imagepicker,
            icon: Icon(Icons.image),
            label: Text('Upload Image')
        ),
      ],
    );
  }
}
