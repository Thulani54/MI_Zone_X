import 'dart:convert'; // For JSON operations
import 'dart:io'; // For file operations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images

class PersonalMemoriesPage extends StatefulWidget {
  @override
  _PersonalMemoriesPageState createState() => _PersonalMemoriesPageState();
}

class _PersonalMemoriesPageState extends State<PersonalMemoriesPage> {
  bool ios = false;
  String queryText = "";
  bool showSearchbar = false;
  String segmentModel = "all";
  bool showDataStory = false;
  bool showData = false;
  dynamic dataReturned;
  dynamic storyData;
  dynamic appUser;
  String? memId;
  String? memorialId;
  List<dynamic>? myStories;
  List<dynamic>? storyList;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    getMyStories();
    getUserDetails();
  }

  void getUserDetails() {
    // This function needs to be adapted to your method of retrieving user details
    String userDetails = '{"user_info": {"id": "123"}}'; // Dummy JSON
    var userDetailObj = json.decode(userDetails);
    print("value $userDetailObj");
    // Assuming your user details are stored in a similar JSON format
    setState(() {
      appUser = userDetailObj['user_info']['id'];
    });
  }

  void getMyStories() {
    // This would be your logic to fetch stories, possibly from a backend
    setState(() {
      myStories = [
        {'title': 'A Day in the Life', 'story': 'It was a great day...'},
        // More stories
      ];
    });
  }

  void segmentChanged(String newValue) {
    setState(() {
      segmentModel = newValue;
    });
  }

  Future<void> fileChange() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        imageFile = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        leading: showSearchbar
            ? IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => setState(() => showSearchbar = false))
            : null,
        title: showSearchbar
            ? TextField(
          autofocus: true,
          onChanged: (value) => setState(() => queryText = value),
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        )
            : Text('Personal Memories'),
        actions: [
          if (!showSearchbar)
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => setState(() => showSearchbar = true),
            ),
        ],
      ),*/
      appBar: AppBar(
        title: showSearchbar ? buildSearchBar() : Text('Personal Memories'),
        actions: [
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
      ),
      body: Column(
        children: [
          if (segmentModel == 'all') buildAllMemories(),
          if (!showSearchbar)
            Container(
              padding: EdgeInsets.all(8),
              child: CupertinoSegmentedControl<String>(
                children: {
                  'all': Text('All MI Memories'),
                  'memories': Text('MI Favourite Memories'),
                },
                onValueChanged: (value) => setState(() => segmentModel = value),
                groupValue: segmentModel,
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: myStories!.length,
              itemBuilder: (context, index) {
                var story = myStories![index];
                return segmentModel == 'all' ||
                        (segmentModel == 'memories' && story['is_favorite'])
                    ? Card(
                        child: Column(
                          children: [
                            if (story['file_path'] != '')
                              Image.asset(story['file_path'],
                                  fit: BoxFit.cover),
                            ListTile(
                              title: Text(story['title']),
                              subtitle: Text(
                                  '${story['from_age']} - ${story['to_age']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(story['story']),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(story['is_favorite']
                                      ? Icons.star
                                      : Icons.star_border),
                                  onPressed: () => setState(() {
                                    story['is_favorite'] =
                                        !story['is_favorite'];
                                  }),
                                  color: Colors.amber,
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // edit story
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.share),
                                  onPressed: () {
                                    // share story
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search',
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
    );
  }

  Widget buildAllMemories() {
    return Expanded(
      child: ListView.builder(
        itemCount: myStories?.length ?? 0,
        itemBuilder: (context, index) {
          var story = myStories?[index];
          return ListTile(
            title: Text(story?['title'] ?? ''),
            subtitle: Text(story?['story'] ?? ''),
          );
        },
      ),
    );
  }

  // bool showSearchbar = false;
  // String segmentModel = 'all';
  // String queryText = '';
  // List<Map<String, dynamic>> myStories = [
  //   {
  //     'id': '1',
  //     'title': 'Summer Vacation',
  //     'from_age': '25',
  //     'to_age': '26',
  //     'story': 'We had a great time visiting the beach...',
  //     'is_favorite': true,
  //     'file_path': 'assets/summer_vacation.jpg'
  //   },
  //   {
  //     'id': '2',
  //     'title': 'Winter Holidays',
  //     'from_age': '27',
  //     'to_age': '28',
  //     'story': 'It was a wonderful winter wonderland...',
  //     'is_favorite': false,
  //     'file_path': 'assets/winter_holidays.jpg'
  //   }
  // ];
}
