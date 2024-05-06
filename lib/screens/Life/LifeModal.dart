import 'package:flutter/material.dart';

class LifeModal extends StatefulWidget {
  @override
  _LifeModalState createState() => _LifeModalState();
}

class _LifeModalState extends State<LifeModal> {
  final _titleController = TextEditingController();
  final _storyController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  String _relationship = 'Spouse'; // default value
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically send data to an API or your backend
      print('Life Information Submitted');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Information'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Life Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _storyController,
                decoration: InputDecoration(
                  labelText: 'Life Story',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a story';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'Author First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Author Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _relationship,
                decoration: InputDecoration(
                  labelText: 'Relationship',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _relationship = newValue!;
                  });
                },
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
