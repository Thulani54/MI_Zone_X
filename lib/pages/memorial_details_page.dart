import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MemorialPage()));
}

class MemorialPage extends StatefulWidget {
  @override
  _MemorialPageState createState() => _MemorialPageState();
}

class _MemorialPageState extends State<MemorialPage> {
  String segment = 'Bio'; // Default segment

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // shareMemorial logic here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildProfileHeader(),
            Container(
              child: Column(
                children: <Widget>[
                  DefaultTabController(
                    length: 4,
                    child: TabBar(
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            setState(() => segment = 'Bio');
                            break;
                          case 1:
                            setState(() => segment = 'Life');
                            break;
                          case 2:
                            setState(() => segment = 'Gallery');
                            break;
                          case 3:
                            setState(() => segment = 'Stories');
                            break;
                        }
                      },
                      tabs: [
                        Tab(icon: Icon(Icons.person), text: 'Bio'),
                        Tab(icon: Icon(Icons.public), text: 'Life'),
                        Tab(icon: Icon(Icons.image), text: 'Gallery'),
                        Tab(icon: Icon(Icons.book), text: 'Stories'),
                      ],
                    ),
                  ),
                  if (segment == 'Bio') buildBioSection(),
                  if (segment == 'Life') buildLifeSection(),
                  if (segment == 'Gallery') buildGallerySection(),
                  if (segment == 'Stories') buildStoriesSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileHeader() {
    // Profile header widget
    return Container(
      child: Text("Profile Header Here"),
    );
  }

  Widget buildBioSection() {
    // Bio section widget
    return Container(
      child: Text("Bio Section Here"),
    );
  }

  Widget buildLifeSection() {
    // Life section widget
    return Container(
      child: Text("Life Section Here"),
    );
  }

  Widget buildGallerySection() {
    // Gallery section widget
    return Container(
      child: Text("Gallery Section Here"),
    );
  }

  Widget buildStoriesSection() {
    // Stories section widget
    return Container(
      child: Text("Stories Section Here"),
    );
  }
}
