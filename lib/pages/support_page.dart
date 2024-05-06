import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: SupportPage(),
  ));
}

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _supportMessage = '';
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showToast("This does not actually send a support request.");
    });
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void _submit() {
    setState(() {
      _submitted = true;
    });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showToast("Your support request has been sent.");
      // Reset the form
      setState(() {
        _supportMessage = '';
        _submitted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Assume there's a drawer
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/icon/android-chrome-512x512.png',
                  height: 100),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your support message below',
                  hintText: 'Type here....',
                ),
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Support message is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _supportMessage = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50) // Makes button wide
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
