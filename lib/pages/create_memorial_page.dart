import 'dart:async';

import 'package:flutter/material.dart';

class MemorialPage extends StatefulWidget {
  @override
  _MemorialPageState createState() => _MemorialPageState();
}

class _MemorialPageState extends State<MemorialPage> {
  String selectedSegment = 'Bio';
  bool showData = true; // This would actually be set based on your data logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate to home screen or any other screen
            },
          ),
        ],
        title: Text('MI Memorial'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (showData) _buildProfileInfo(),
            if (!showData) _buildDefaultProfileInfo(),
            SizedBox(height: 20),
            _buildSegmentControl(),
            if (selectedSegment == 'Bio') _buildBioSection(),
            if (selectedSegment == 'Life') _buildLifeSection(),
            if (selectedSegment == 'Gallery') _buildGallerySection(),
            if (selectedSegment == 'Stories') _buildStoriesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: NetworkImage(
              'https://example.com/image_url.jpg'), // Replace with actual image URL
        ),
        Text(
          "User's Full Name",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text("User's Occupation or any other detail"),
      ],
    );
  }

  Widget _buildDefaultProfileInfo() {
    return Column(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: NetworkImage(
              'https://icons-for-free.com/iconfiles/png/512/human+person+user+icon-1320196276306824343.png'),
        ),
        Text(
          "Default User Name",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text("No additional details available"),
      ],
    );
  }

  Widget _buildSegmentControl() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildSegmentOption('Bio', Icons.person),
          _buildSegmentOption('Life', Icons.favorite),
          _buildSegmentOption('Gallery', Icons.image),
          _buildSegmentOption('Stories', Icons.book),
        ],
      ),
    );
  }

  Widget _buildSegmentOption(String title, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSegment = title;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selectedSegment == title ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Icon(icon,
                  color:
                      selectedSegment == title ? Colors.white : Colors.black),
              Text(
                title,
                style: TextStyle(
                  color: selectedSegment == title ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bio',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text("Biographical details here..."),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text('Edit Bio'),
        ),
      ],
    );
  }

  Widget _buildLifeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Life',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text("Life details here..."),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text('Edit Life'),
        ),
      ],
    );
  }

  Widget _buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gallery',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text("Gallery content here..."),
      ],
    );
  }

  Widget _buildStoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text("Stories content here..."),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text('Add new'),
        ),
      ],
    );
  }
}

class CreateMemorialPage with ChangeNotifier {
  String segmentModel = 'Bio';
  String segmentModel2 = 'Image';
  bool showData = false;
  bool showDataLife = false;
  bool showDataStory = false;
  bool showSongData = false;
  bool hideMe = true;
  bool isHideProfileImage = false;
  bool viewFlag = false;
  bool isPublished = false;
  double scrollY = 0;
  String pubMemorialId = '';
  String sharingLink = '';
  dynamic userDetail;
  dynamic dataReturned;
  dynamic lifeData;
  dynamic storyData;
  dynamic dataSongReturned;

  CreateMemorial createMem = CreateMemorial(
    id: '',
    appUserId: '',
    createdBy: '',
    isPublished: false,
  );

  Future<void> openModal(BuildContext context) async {
    // You need to implement BioModalComponent as a dialog or a new route
  }

  Future<void> selectSong(BuildContext context) async {
    // You need to implement SelectThemePage as a dialog or a new route
  }

  Future<void> openLifeModal(BuildContext context) async {
    // You need to implement LifeModalComponent as a dialog or a new route
  }

  Future<void> openStoriesModal(BuildContext context) async {
    // You need to implement StoriesModalComponent as a dialog or a new route
  }

  Future<void> publishMemorial() async {
    // Simulated HTTP request
    await Future.delayed(Duration(seconds: 2));
    // Simulate API response
    var response = {'status': 'Success', 'message': '12345'};
    if (response['status'] == 'Success') {
      pubMemorialId = response['message']!;
      sharingLink = 'https://mi-zone-7df52.web.app/home/$pubMemorialId';
      createMem = CreateMemorial(
        id: pubMemorialId,
        appUserId: createMem.appUserId,
        createdBy: createMem.createdBy,
        isPublished: true,
      );
      isPublished = true;
      notifyListeners();
    } else {
      isPublished = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    print('ngOnDestroy - create memorial Page');
  }
}

class CreateMemorial {
  String id;
  String appUserId;
  String createdBy;
  bool isPublished;

  CreateMemorial({
    required this.id,
    required this.appUserId,
    required this.createdBy,
    required this.isPublished,
  });
}
