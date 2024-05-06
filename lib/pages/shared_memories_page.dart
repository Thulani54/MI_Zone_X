import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PublishedMemorialsPage(),
  ));
}

class PublishedMemorialsPage extends StatefulWidget {
  @override
  _PublishedMemorialsPageState createState() => _PublishedMemorialsPageState();
}

class _PublishedMemorialsPageState extends State<PublishedMemorialsPage> {
  bool showSearchbar = false;
  String queryText = '';
  List<Map<String, dynamic>> createdMemorials = [
    {
      'mem_id': '1',
      'bio': [
        {
          'profile_image': 'assets/profile1.png',
          'first_name': 'John',
          'last_name': 'Doe',
          'date_of_birth': '1990',
          'date_of_death': '2020'
        }
      ]
    },
    // Add more memorials here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: showSearchbar
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
        title: showSearchbar
            ? TextField(
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    queryText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              )
            : Text('Published Memorials'),
        actions: [
          if (!showSearchbar)
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  showSearchbar = true;
                });
              },
            ),
          if (showSearchbar)
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  showSearchbar = false;
                  queryText = '';
                });
              },
            ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
            childAspectRatio: 3,
          ),
          itemCount: createdMemorials.length,
          itemBuilder: (context, index) {
            var memorial = createdMemorials[index];
            if (memorial['bio'].isNotEmpty &&
                (queryText.isEmpty ||
                    "${memorial['bio'][0]['first_name']} ${memorial['bio'][0]['last_name']}"
                        .toLowerCase()
                        .contains(queryText.toLowerCase()))) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (memorial['bio'][0]['profile_image'] != null)
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(memorial['bio'][0]['profile_image']),
                      ),
                    Text(
                        "${memorial['bio'][0]['first_name']} ${memorial['bio'][0]['last_name']}"),
                    Text(
                        "${memorial['bio'][0]['date_of_birth'].substring(0, 4)} - ${memorial['bio'][0]['date_of_death'].substring(0, 4)}"),
                    ElevatedButton(
                      child: const Text('View'),
                      onPressed: () => viewMemorialDetails(memorial['mem_id']),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  void viewMemorialDetails(String memId) {
    // Navigate to the memorial details page
    print('Viewing details of memorial $memId');
  }
}
