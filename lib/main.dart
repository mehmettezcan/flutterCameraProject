import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

void main() => runApp(CameraApp());

class CameraApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CameraAppState();
  }
}

class _CameraAppState extends State {
  File _image;

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Camera App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: <Widget>[
                  IconButton(
                      icon: Image(
                        image: AssetImage('images/camera.png'),
                      ),
                      onPressed: () {
                        getImage(true);
                      }),
                  Text('Fotoğraf'),
                ]),
                SizedBox(width: 50),
                Column(children: <Widget>[
                  IconButton(
                      icon: Image(
                        image: AssetImage('images/temAl.png'),
                      ),
                      onPressed: () {
                        getImage(false);
                      }),
                  Text('TemAl'),
                ]),
              ],
            ),
            SizedBox(height: 50),
            _image == null
                ? Container()
                : Image.file(
                    _image,
                    height: 150.00,
                    width: 150.00,
                  ),
          ],
        ),
      ),
    ));
  }
}
