import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../models/ZoneXOld.dart';

// Model classes

// Helper classes
class FormData {
  List<MapEntry<String, dynamic>> fields = [];
  List<MapEntry<String, MultipartFile>> files = [];

  void addField(String name, dynamic value) {
    fields.add(MapEntry(name, value));
  }

  void addFile(File file, String name) {
    files.add(MapEntry(
        name,
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split('/').last)));
  }
}

class MultipartFile {
  final String path;
  final String filename;

  MultipartFile.fromFileSync(this.path, {required this.filename});
}

// Share your story screen
class ShareYourStoryScreen extends StatefulWidget {
  @override
  _ShareYourStoryScreenState createState() => _ShareYourStoryScreenState();
}

class _ShareYourStoryScreenState extends State<ShareYourStoryScreen> {
  final _storyFormKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _storyController = TextEditingController();
  final _fromAgeController = TextEditingController();
  final _toAgeController = TextEditingController();
  File? _imageFile;

  @override
  void dispose() {
    _titleController.dispose();
    _storyController.dispose();
    _fromAgeController.dispose();
    _toAgeController.dispose();
    super.dispose();
  }

  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_storyFormKey.currentState!.validate()) {
      // Implement your submission logic here
      print('Story Submitted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share your story'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _storyFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Story Title',
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
                maxLines: 6,
                decoration: InputDecoration(
                  labelText: 'Story Description',
                  hintText: 'Ex. First spring of 1980...',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _fromAgeController,
                      decoration: InputDecoration(
                        labelText: 'From',
                        border: OutlineInputBorder(),
                        hintText: 'Ex. 1980',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a starting year';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: _toAgeController,
                      decoration: InputDecoration(
                        labelText: 'To',
                        border: OutlineInputBorder(),
                        hintText: 'Ex. 1985',
                      ),
                      validator: (value) {
                        if (value == null || value!.isEmpty) {
                          return 'Please enter an ending year';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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

// Add Personal Story Component (Can be made into a separate widget as needed)
class AddPersonalStoryComponent extends StatefulWidget {
  @override
  _AddPersonalStoryComponentState createState() =>
      _AddPersonalStoryComponentState();
}

class _AddPersonalStoryComponentState extends State<AddPersonalStoryComponent> {
  final storyDetails = StoryDetails(
    appUserId: "",
    memorialId: "",
    id: "",
    title: "",
    story: "",
    fromAge: "",
    toAge: "",
    isFavorite: false,
  );

  bool isSubmitted = false;
  String fileName = '';
  List<File> fileList = [];

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  void fetchUserDetails() async {
    try {
      final userDetailStr =
          await rootBundle.loadString('assets/user_details.json');
      final userDetailObj = jsonDecode(userDetailStr);
      setState(() {
        storyDetails.appUserId = userDetailObj['user_info']['id'];
        storyDetails.memorialId = userDetailObj['mem_id'];
      });
    } catch (e) {
      print('Failed to load user details');
    }
  }

  void fileChange(File file) {
    if (file != null) {
      fileList.add(file);
      fileName = file.path.split('/').last;
    }
  }

  void displayStoryFunctionRecall() {
    // UserData service function call
    print('Display story function is called');
  }

  void onSubmit() {
    isSubmitted = true;
    var formData = FormData();
    if (fileList.isNotEmpty) {
      formData.addFile(fileList.first, 'uploadFile');
    }
    formData.addField('data', jsonEncode(storyDetails.toJson()));

    // Assuming userData is a service with a method to post data
    postData(formData).then((response) {
      if (response.statusCode == 200) {
        print('Story added successfully');
        showToast('Gift of memories', 'was successfully added!');
      } else {
        showToast('Error', 'An error occurred');
      }
    });
  }

  Future<http.Response> postData(FormData formData) async {
    var response = await http.post(
      Uri.parse('https://example.com/api/memorialStories'),
      body: formData,
    );
    return response;
  }

  void showToast(String header, String message) {
    // This would typically use Flutter's toast or snack bar functionality
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Personal Story'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Form and other widgets here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onSubmit,
        tooltip: 'Add Story',
        child: Icon(Icons.add),
      ),
    );
  }
}
