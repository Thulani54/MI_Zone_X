import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewJournalEntryPage extends StatefulWidget {
  @override
  _NewJournalEntryPageState createState() => _NewJournalEntryPageState();
}

class _NewJournalEntryPageState extends State<NewJournalEntryPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed('/mi-journal'),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(_image == null
                        ? 'No Image selected.'
                        : _image!.path.split('/').last),
                  ),
                  FloatingActionButton(
                    onPressed: _pickImage,
                    tooltip: 'Pick Image',
                    child: Icon(Icons.attach_file),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Implement the logic to handle form submission
                    // including file and data upload
                    Navigator.of(context).pushNamed('/mi-journal');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Submit'),
                    Icon(Icons.create),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}

class JournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Journal")),
      body: Center(child: Text("Journal Page")),
    );
  }
}

class MIJournalPage extends StatefulWidget {
  @override
  _MIJournalPageState createState() => _MIJournalPageState();
}

class _MIJournalPageState extends State<MIJournalPage> {
  bool showSearchbar = false;
  bool ios = true; // Assuming iOS for the segment control visibility
  String segmentModel = 'all';
  String queryText = '';
  List<dynamic> myStories = [
    {
      'title': 'Day at the Park',
      'from_age': '25',
      'to_age': '26',
      'story': 'It was a lovely day...',
      'is_favorite': true,
      'file_path': 'assets/image1.jpg',
      'id': '1',
    },
    {
      'title': 'Beach Holiday',
      'from_age': '27',
      'to_age': '28',
      'story': 'Sunny days and cool nights...',
      'is_favorite': false,
      'file_path': 'assets/image2.jpg',
      'id': '2',
    },
    // Add more stories as needed
  ];

  void segmentChanged(String newValue) {
    setState(() {
      segmentModel = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: !showSearchbar
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushNamed('/mi-space');
                },
              )
            : null,
        title: !ios && !showSearchbar ? Text('MI Memories') : null,
        actions: <Widget>[
          if (!ios && !showSearchbar)
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  showSearchbar = true;
                });
              },
            ),
        ],
        bottom: showSearchbar
            ? PreferredSize(
                preferredSize: Size.fromHeight(56.0),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          showSearchbar = false;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      queryText = value;
                    });
                  },
                ),
              )
            : null,
      ),
      body: Column(
        children: <Widget>[
          if (ios)
            CupertinoSegmentedControl<String>(
              children: {
                'all': Text('All MI Memories'),
                'memories': Text('MI Favourite Memories'),
              },
              onValueChanged: segmentChanged,
              groupValue: segmentModel,
            ),
          Expanded(
            child: segmentModel == 'all'
                ? buildAllMemories()
                : buildFavoriteMemories(),
          ),
        ],
      ),
    );
  }

  Widget buildAllMemories() {
    return ListView.builder(
      itemCount: myStories.length,
      itemBuilder: (context, index) {
        var story = myStories[index];
        return story['file_path'] != ''
            ? Card(
                child: Column(
                  children: <Widget>[
                    Image.asset(story['file_path']),
                    ListTile(
                      title: Text(story['title']),
                      subtitle:
                          Text('${story['from_age']} - ${story['to_age']}'),
                    ),
                    Text(story['story']),
                    // Add your buttons and other UI elements here
                  ],
                ),
              )
            : Container();
      },
    );
  }

  Widget buildFavoriteMemories() {
    return ListView.builder(
      itemCount: myStories.length,
      itemBuilder: (context, index) {
        var story = myStories[index];
        return story['is_favorite']
            ? Card(
                child: Column(
                  children: <Widget>[
                    Image.asset(story['file_path']),
                    ListTile(
                      title: Text(story['title']),
                      subtitle:
                          Text('${story['from_age']} - ${story['to_age']}'),
                    ),
                    Text(story['story']),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
