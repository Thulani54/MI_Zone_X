import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateNewUserScreen extends StatefulWidget {
  @override
  _CreateNewUserScreenState createState() => _CreateNewUserScreenState();
}

class _CreateNewUserScreenState extends State<CreateNewUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String _relationship = '';
  String _gender = 'male';
  DateTime? _dob;
  DateTime? _passedAwayDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Form Submitted');
      // Here you would typically call an API to submit the form data
      Navigator.pop(context); // Dismiss the modal/screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New User'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _relationship,
                hint: Text('Your Relationship'),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _relationship = newValue;
                    });
                  }
                },
                validator: (value) => value == null || value.isEmpty
                    ? '*Relationship is required'
                    : null,
                items: <String>[
                  'Spouse',
                  'Son',
                  'Daughter',
                  'Grandson',
                  'Granddaughter',
                  'Grandmother',
                  'Grandfather',
                  'Uncle',
                  'Aunt',
                  'Neice',
                  'Nephew',
                  'Father',
                  'Mother',
                  'Friend'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*First name is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _middleNameController,
                decoration: InputDecoration(labelText: 'Middle Name'),
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Last name is required';
                  }
                  return null;
                },
              ),
              ListTile(
                title: Text('Gender'),
                trailing: DropdownButton<String>(
                  value: _gender,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _gender = newValue;
                      });
                    }
                  },
                  items: <String>['male', 'female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ListTile(
                title: Text('Date of Birth'),
                subtitle: Text(
                    _dob != null ? _dateFormat.format(_dob!) : 'Select Date'),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != _dob) {
                    setState(() {
                      _dob = picked;
                    });
                  }
                },
              ),
              ListTile(
                title: Text('Deceased On'),
                subtitle: Text(_passedAwayDate != null
                    ? _dateFormat.format(_passedAwayDate!)
                    : 'Select Date'),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != _passedAwayDate) {
                    setState(() {
                      _passedAwayDate = picked;
                    });
                  }
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
