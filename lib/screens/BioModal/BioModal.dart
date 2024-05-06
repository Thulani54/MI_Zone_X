import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class BioInformationScreen extends StatefulWidget {
  @override
  _BioInformationScreenState createState() => _BioInformationScreenState();
}

class _BioInformationScreenState extends State<BioInformationScreen> {
  final _bioFormKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _dodController = TextEditingController();
  TextEditingController _headlineController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  File? _imageFile;
  String _profileImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bio Information'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _bioFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _middleNameController,
                decoration: InputDecoration(
                  labelText: 'Middle Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter date of birth';
                  }
                  return null;
                },
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  if (pickedDate != null) {
                    String formattedDate =
                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                    setState(() {
                      _dobController.text = formattedDate;
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _dodController,
                decoration: InputDecoration(
                  labelText: 'Date of Death',
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  if (pickedDate != null) {
                    String formattedDate =
                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                    setState(() {
                      _dodController.text = formattedDate;
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _headlineController,
                decoration: InputDecoration(
                  labelText: 'Bio Headline',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a headline';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Bio Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _imageFile == null
                      ? Center(child: Text('Tap here to select an image'))
                      : Image.file(_imageFile!),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_bioFormKey.currentState!.validate()) {
                    // Implement your submission logic here
                    print('Bio Submitted');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _dodController.dispose();
    _headlineController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _profileImage =
            pickedFile.path; // Assuming this is how you handle file paths
      });
    }
  }

  Future<void> submitBio() async {
    if (!_formKey.currentState!.validate()) {
      return; // Form is not valid
    } else {
      // If there's an image, upload it with other details
      var uri = Uri.parse('https://example.com/api/bio');
      var request = http.MultipartRequest('POST', uri);
      request.fields['first_name'] = _firstNameController.text;
      request.fields['middle_name'] = _middleNameController.text;
      request.fields['last_name'] = _lastNameController.text;
      request.fields['dob'] = _dobController.text;
      request.fields['dod'] = _dodController.text;
      request.fields['headline'] = _headlineController.text;
      request.fields['description'] = _descriptionController.text;
      if (_imageFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'profile_image', _imageFile!.path));
      }

      var response = await request.send();
      if (response.statusCode == 200) {
        print('Bio uploaded successfully');
      } else {
        print('Failed to upload bio');
      }
    }
  }
}
