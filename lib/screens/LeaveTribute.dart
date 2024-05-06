import 'package:flutter/material.dart';

class LeaveTributeDialog extends StatefulWidget {
  @override
  _LeaveTributeDialogState createState() => _LeaveTributeDialogState();
}

class _LeaveTributeDialogState extends State<LeaveTributeDialog> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submitTribute() {
    if (_formKey.currentState!.validate()) {
      // Here you would usually send the data to a backend or handle it accordingly
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Leave a Tribute',
                      style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
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
                SizedBox(height: 10),
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
                SizedBox(height: 10),
                TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    labelText: 'Your Tribute Message',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitTribute,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
