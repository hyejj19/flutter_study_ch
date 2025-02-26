import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class WriteScreen extends StatefulWidget {
  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _textController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadPost() async {
    if (_textController.text.isEmpty) return;
    String imageUrl = '';

    if (_image != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('posts/${DateTime.now().toIso8601String()}');
      await ref.putFile(_image!);
      imageUrl = await ref.getDownloadURL();
    }

    await FirebaseFirestore.instance.collection('posts').add({
      'text': _textController.text,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _textController,
                decoration: InputDecoration(hintText: 'Write something...')),
            SizedBox(height: 10),
            _image != null ? Image.file(_image!, height: 100) : Container(),
            ElevatedButton(onPressed: _pickImage, child: Text('Pick Image')),
            ElevatedButton(onPressed: _uploadPost, child: Text('Upload Post')),
          ],
        ),
      ),
    );
  }
}
