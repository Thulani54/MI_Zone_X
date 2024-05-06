import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StoriesModalComponent extends StatefulWidget {
  @override
  _StoriesModalComponentState createState() => _StoriesModalComponentState();
}

class _StoriesModalComponentState extends State<StoriesModalComponent> {
  final _titleController = TextEditingController();
  final _storyController = TextEditingController();
  final _fromAgeController = TextEditingController();
  final _toAgeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  bool _isSubmitted = false;
  String _fileName = '';

  @override
  void dispose() {
    _titleController.dispose();
    _storyController.dispose();
    _fromAgeController.dispose();
    _toAgeController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _fileName = pickedFile.name;
      });
    }
  }

  void submitStory() {
    setState(() => _isSubmitted = true);
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic, possibly sending data to a backend server
      print('Submitting story with title: ${_titleController.text}');
      // Show confirmation message or handle the response from the server
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Your Story'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title of Memory',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _storyController,
                decoration: InputDecoration(
                  labelText: 'Description of Memory',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _fromAgeController,
                decoration: InputDecoration(
                  labelText: 'From Age',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the starting age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _toAgeController,
                decoration: InputDecoration(
                  labelText: 'To Age',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ending age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: _imageFile == null
                      ? Center(child: Text('Tap here to add an image'))
                      : Image.file(_imageFile!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitStory,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
