import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FuneralProgramPage extends StatefulWidget {
  @override
  _FuneralProgramPageState createState() => _FuneralProgramPageState();
}

class _FuneralProgramPageState extends State<FuneralProgramPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _dateOfDeathController = TextEditingController();
  final TextEditingController _streetNoController = TextEditingController();
  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _suburbController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _obituaryAuthorController =
      TextEditingController();
  final TextEditingController _obituaryController = TextEditingController();
  final TextEditingController _acknowledgementAuthorController =
      TextEditingController();
  final TextEditingController _acknowledgementMessageController =
      TextEditingController();

  Map<String, dynamic> program = {
    'id': "",
    'first_name': "",
    'last_name': "",
    'date_of_birth': "",
    'date_of_death': "",
    'headline': "",
    'obituary': "",
    'obituary_author': "",
    'acknowledgement_message': "",
    'acknowledgement_author': "",
    'app_user_id': "",
    'street_no': "",
    'street_name': "",
    'suburb': "",
    'city': "",
    'province': "",
    'postal_code': "",
    'is_shared': false,
  };

  bool isToggled = false;
  String fileName = '';
  XFile? _file;

  List<String> provinceList = [
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

  void toggleShared() {
    setState(() {
      isToggled = !isToggled;
      program['is_shared'] = isToggled;
    });
  }

  void fileChange(XFile? file) {
    setState(() {
      _file = file;
      fileName = file?.name ?? '';
    });
  }

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var uri = Uri.parse('API_URL'); // Define your API URL
      var request = http.MultipartRequest('POST', uri);

      // Attach text fields data
      program.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Attach the file if selected
      if (_file != null) {
        request.files
            .add(await http.MultipartFile.fromPath('uploadFile', _file!.path));
      }

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        // Handle successful upload
        Navigator.of(context).pop(); // Go back or navigate to another screen
      } else {
        // Handle error
        print('Failed to create program');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funeral Program'),
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateOfBirthController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter date of birth';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateOfDeathController,
                decoration: InputDecoration(labelText: 'Date of Death'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter date of death';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetNoController,
                decoration: InputDecoration(labelText: 'Street Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter street number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetNameController,
                decoration: InputDecoration(labelText: 'Street Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter street name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _suburbController,
                decoration: InputDecoration(labelText: 'Suburb'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter suburb';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _postalCodeController,
                decoration: InputDecoration(labelText: 'Postal Code'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter postal code';
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
                    return 'Please enter obituary text';
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
                    return 'Please enter acknowledgement message';
                  }
                  return null;
                },
              ),

              // Repeat similar TextFormField setup for each field
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
                  }
                },
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data and share
                  }
                },
                child: Text('Save & Share'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
