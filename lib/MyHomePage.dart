import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
  }

  Future<void> _optionDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text(
                    "TAKE A PICTURE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: openCamera,
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                GestureDetector(
                  child: Text(
                    "SELECT A PICTURE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: openGallery,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MY CAMERA APP'),
        ),
        body: Center(
          child: _image == null
              ? Text(
                  "NO IMAGE",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              : Image.file(_image),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _optionDialogBox,
          child: Icon(Icons.add_a_photo),
          tooltip: "open camera",
        ));
  }
}
