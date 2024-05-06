import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ValuetainmentPage(),
  ));
}

class ValuetainmentPage extends StatefulWidget {
  @override
  _ValuetainmentPageState createState() => _ValuetainmentPageState();
}

class _ValuetainmentPageState extends State<ValuetainmentPage> {
  String category = "Category Name";
  String filterTerm = "";
  List<Map<String, dynamic>> feed = [
    {
      'id': '1',
      'title': 'First Video',
      'text': 'This is the first video description',
      'src': 'http://example.com/video1.mp4',
      'likes': 10,
      'dislikes': 3,
    },
    {
      'id': '2',
      'title': 'Second Video',
      'text': 'This is the second video description',
      'src': 'http://example.com/video2.mp4',
      'likes': 20,
      'dislikes': 5,
    }
    // Add more items as needed.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        title: Text(category),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search...',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    filterTerm = value;
                  });
                },
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Adjust number of columns
              ),
              itemCount: feed.length,
              itemBuilder: (context, index) {
                var item = feed[index];
                return Visibility(
                  visible: item['title']
                      .toLowerCase()
                      .contains(filterTerm.toLowerCase()),
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: item['src'] != null
                              ? Image.network(item['src'],
                                  fit: BoxFit.cover) // Placeholder for video
                              : Image.network(
                                  'https://www.voas.fi/images/video/not-supported.jpg'),
                        ),
                        ListTile(
                          title: Text(item['title']),
                          subtitle: Text(item['text']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
