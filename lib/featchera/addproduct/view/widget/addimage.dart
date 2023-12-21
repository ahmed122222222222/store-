

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyCustomImagePicker extends StatefulWidget {
  @override
  _MyCustomImagePickerState createState() => _MyCustomImagePickerState();
}

class _MyCustomImagePickerState extends State<MyCustomImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Pick Image'),
        ),
        SizedBox(height: 16),
        _image != null
            ? Image.file(_image!)
            : Text('No image selected'),
      ],
    );
  }
}