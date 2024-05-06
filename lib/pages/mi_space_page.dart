import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: {
      '/home': (context) => HomeScreen(),
      '/view-people': (context) => PeopleScreen(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSearchbar = false;
  bool ios = true; // This should be dynamically set based on the platform
  List<Map<String, dynamic>> items = [
    {
      'path': '/view-people',
      'icon': Icons.people_outline,
      'title': 'View People'
    },
    {'path': '/home', 'icon': Icons.home, 'title': 'Home'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: showSearchbar
            ? null
            : IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  // Logic to handle menu button if needed
                },
              ),
        title: !ios && !showSearchbar ? Text("Your App Title") : null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people_outline),
            onPressed: () => Navigator.of(context).pushNamed('/view-people'),
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pushNamed('/home'),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/icon/android-chrome-512x512.png',
                  width: 128, height: 128),
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Adjust number of columns
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(items[index]['path']),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(items[index]['icon']),
                            Text(items[index]['title']),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Home Page")),
    );
  }
}

class PeopleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("People")),
      body: Center(child: Text("People Page")),
    );
  }
}
