import 'package:flutter/material.dart';

class ValuetainmentHomePage extends StatefulWidget {
  @override
  _ValuetainmentHomePageState createState() => _ValuetainmentHomePageState();
}

class _ValuetainmentHomePageState extends State<ValuetainmentHomePage> {
  List<Map<String, dynamic>> categories = [];
  bool isLoading = true;
  String error = "";

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    // Simulate network request
    await Future.delayed(Duration(seconds: 2));
    try {
      setState(() {
        categories = [
          {'id': '1', 'category': 'Music', 'icon': Icons.music_note},
          {'id': '2', 'category': 'Sports', 'icon': Icons.sports_soccer},
          {'id': '3', 'category': 'News', 'icon': Icons.new_releases},
          // Add more categories as needed
        ];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = "Failed to load data.";
        isLoading = false;
      });
    }
  }

  void viewCatVideos(String category) {
    print("Selected category: $category");
    // Implement navigation logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        title: Text('Categories'),
      ),
      body: isLoading
          ? buildSkeleton()
          : categories == null
              ? Text('Error: $error')
              : buildCategoryGrid(),
    );
  }

  Widget buildSkeleton() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(backgroundColor: Colors.grey[300]),
            SizedBox(height: 8),
            Container(width: 80, height: 10, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return GestureDetector(
          onTap: () => viewCatVideos(category['category']),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(category['icon'], size: 40),
                SizedBox(height: 8),
                Text(category['category']),
              ],
            ),
          ),
        );
      },
    );
  }
}
