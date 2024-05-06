import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProgramPage extends StatefulWidget {
  @override
  _EditProgramPageState createState() => _EditProgramPageState();
}

class _EditProgramPageState extends State<EditProgramPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _headlineController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _dateOfDeathController = TextEditingController();
  TextEditingController _obituaryController = TextEditingController();
  TextEditingController _obituaryAuthorController = TextEditingController();
  TextEditingController _acknowledgementMessageController =
      TextEditingController();
  TextEditingController _acknowledgementAuthorController =
      TextEditingController();
  TextEditingController _streetNoController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _suburbController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  String _province = '';
  List<String> _provinceList = [
    'Eastern Cape',
    'Free State',
    'Gauteng',
    'KwaZulu-Natal',
    'Limpopo',
    'Mpumalanga',
    'Northern Cape',
    'North West',
    'Western Cape'
  ];
  File? _image;

  @override
  void dispose() {
    _headlineController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateOfBirthController.dispose();
    _dateOfDeathController.dispose();
    _obituaryController.dispose();
    _obituaryAuthorController.dispose();
    _acknowledgementMessageController.dispose();
    _acknowledgementAuthorController.dispose();
    _streetNoController.dispose();
    _streetNameController.dispose();
    _suburbController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you can handle the submission logic
      print('Form is valid and ready to submit data');
      Navigator.pop(context); // Close the screen after submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funeral Program'),
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.red,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _headlineController,
                decoration: InputDecoration(labelText: 'Headline'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a headline';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the last name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dateOfBirthController,
                      decoration: InputDecoration(labelText: 'Date of Birth'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter date of birth';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _dateOfDeathController,
                      decoration: InputDecoration(labelText: 'Date of Death'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter date of death';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _streetNoController,
                decoration: InputDecoration(labelText: 'Street Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the street number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetNameController,
                decoration: InputDecoration(labelText: 'Street Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the street name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _suburbController,
                decoration: InputDecoration(labelText: 'Suburb'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the suburb';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the city';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _province,
                onChanged: (String? newValue) {
                  setState(() {
                    _province = newValue!;
                  });
                },
                items:
                    _provinceList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Province'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a province';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _postalCodeController,
                decoration: InputDecoration(labelText: 'Postal Code'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the postal code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _obituaryAuthorController,
                decoration: InputDecoration(labelText: 'Obituary Author'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name of the obituary author';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _obituaryController,
                decoration: InputDecoration(labelText: 'Obituary'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the obituary';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _acknowledgementAuthorController,
                decoration:
                    InputDecoration(labelText: 'Acknowledgement Author'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name of the acknowledgement author';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _acknowledgementMessageController,
                decoration:
                    InputDecoration(labelText: 'Acknowledgement Message'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the acknowledgement message';
                  }
                  return null;
                },
              ),
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
