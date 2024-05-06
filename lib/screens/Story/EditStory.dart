import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditStoryModal extends StatefulWidget {
  @override
  _EditStoryModalState createState() => _EditStoryModalState();
}

class _EditStoryModalState extends State<EditStoryModal> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _fromAgeController = TextEditingController();
  final _toAgeController = TextEditingController();
  File? _image;
  final _formKey = GlobalKey<FormState>();

  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Implement your submission logic here
      print('Story Updated');
      Navigator.pop(context); // Close the modal
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Your Story"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Story Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Story Description'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fromAgeController,
                decoration: InputDecoration(labelText: 'From Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the starting age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _toAgeController,
                decoration: InputDecoration(labelText: 'To Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ending age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _image == null
                  ? ElevatedButton(
                      onPressed: pickImage,
                      child: Text('Add Image'),
                    )
                  : Image.file(_image!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
