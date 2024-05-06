import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class EditAccountDetailsPage extends StatefulWidget {
  @override
  _EditAccountDetailsPageState createState() => _EditAccountDetailsPageState();
}

class _EditAccountDetailsPageState extends State<EditAccountDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dateOfBirthController =
      TextEditingController(); // for date selection
  TextEditingController _genderController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _streetNoController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _suburbController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();

  late File _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/mi-space');
            },
          ),
        ],
        title: Text('Edit Account Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_image != null) Image.file(_image),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Select Image'),
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateOfBirthController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _idNumberController,
                decoration: InputDecoration(labelText: 'ID Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your ID number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetNoController,
                decoration: InputDecoration(labelText: 'Street Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your street number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetNameController,
                decoration: InputDecoration(labelText: 'Street Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your street name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _suburbController,
                decoration: InputDecoration(labelText: 'Suburb'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your suburb';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _provinceController,
                decoration: InputDecoration(labelText: 'Province'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select your province';
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
                    return 'Please enter your postal code';
                  }
                  return null;
                },
              ),

              // Add other fields in a similar way
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
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
}

class EditProfilePage with ChangeNotifier {
  String id = '';
  String addressId = '';
  String title = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String username = '';
  String gender = '';
  String dateOfBirth = '';
  String idNumber = '';
  String contactNumber = '';
  String profilePic = '';
  String memId = '';
  String streetNo = '';
  String streetName = '';
  String suburb = '';
  String city = '';
  String province = '';
  String postalCode = '';

  bool isSubmitted = false;
  List<String> titleList = ['Mr', 'Mrs', 'Ms', 'Miss'];
  List<String> genderList = ['Female', 'Male'];
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

  Future<void> getUserDetails() async {
    // Simulate API call to get user details
    var userDetails =
        await http.get(Uri.parse('https://api.example.com/user_details'));
    var userDetailObj = json.decode(userDetails.body);

    id = userDetailObj['user_info']['id'];
    profilePic = userDetailObj['user_info']['profilePic'];
    title = userDetailObj['user_info']['title'];
    firstName = userDetailObj['user_info']['first_name'];
    lastName = userDetailObj['user_info']['last_name'];
    dateOfBirth = userDetailObj['user_info']['date_of_birth'];
    gender = userDetailObj['user_info']['gender'];
    idNumber = userDetailObj['user_info']['id_number'];
    contactNumber = userDetailObj['user_info']['contact_number'];
    email = userDetailObj['user_info']['email'];
    username = userDetailObj['user_info']['username'];

    if (userDetailObj['user_address'] != null) {
      addressId = userDetailObj['user_address']['address_id'];
      streetNo = userDetailObj['user_address']['street_no'];
      streetName = userDetailObj['user_address']['street_name'];
      suburb = userDetailObj['user_address']['suburb'];
      city = userDetailObj['user_address']['city'];
      province = userDetailObj['user_address']['province'];
      postalCode = userDetailObj['user_address']['postal_code'];
    }
    notifyListeners();
  }

  Future<void> updateUserDetails() async {
    var formData = json.encode({
      'id': id,
      'address_id': addressId,
      'title': title,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'username': username,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'id_number': idNumber,
      'contact_number': contactNumber,
      'profilePic': profilePic,
      'mem_id': memId,
      'street_no': streetNo,
      'street_name': streetName,
      'suburb': suburb,
      'city': city,
      'province': province,
      'postal_code': postalCode
    });

    var response = await http.post(
      Uri.parse('https://api.example.com/update_user'),
      headers: {'Content-Type': 'application/json'},
      body: formData,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['status'] == 'Success') {
        addressId = data['message']['Address_id'];
        // Logic to handle successful update
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    print('Destroying Edit Profile Page');
  }
}
