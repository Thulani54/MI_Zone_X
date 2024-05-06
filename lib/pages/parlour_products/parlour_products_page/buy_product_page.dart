import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String selectedTitle = "";
  double progressValue = 0.5;
  String productName = "Product Name";
  String planType = "Plan Type";
  List<String> titles = ['Mr', 'Mrs', 'Ms', 'Dr'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LinearProgressIndicator(value: progressValue),
              Text('$productName - $planType',
                  style: Theme.of(context).textTheme.headline5),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter first name';
                  return null;
                },
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter last name';
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter email';
                  if (!value.contains('@')) return 'Invalid email';
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter phone number';
                  if (value.length != 10)
                    return 'Phone number must be 10 digits';
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: selectedTitle,
                onChanged: (newValue) {
                  setState(() {
                    selectedTitle = newValue!;
                  });
                },
                items: titles.map((title) {
                  return DropdownMenuItem(
                    child: Text(title),
                    value: title,
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null) return 'Please select a title';
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Form Submitted'),
          content: Text(
              'Name: ${firstNameController.text}\nEmail: ${emailController.text}'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
