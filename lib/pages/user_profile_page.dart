import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserProfilePage(),
  ));
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String profilePic =
      'path_to_default_profile_pic.jpg'; // Update with actual path
  String firstName = 'John';
  String lastName = 'Doe';
  String username = 'johndoe123';
  String email = 'john.doe@example.com';
  String contactNumber = '123-456-7890';
  String address = '123 Street Name, City, Country';

  List<Tile> tiles = [
    Tile(title: 'MiJournals', path: '/mi-journal', icon: Icons.book),
    Tile(title: 'MiMemories', path: '/personal-memories', icon: Icons.memory),
    Tile(title: 'Published', path: '/shared-memories', icon: Icons.publish),
    Tile(
        title: 'MiFriends Memorials',
        path: '/friends-memories',
        icon: Icons.group),
    Tile(title: 'Settings', path: '/settings', icon: Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logout(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (profilePic.isNotEmpty)
              CircleAvatar(
                backgroundImage: AssetImage(profilePic),
                radius: 75,
              ),
            Text('$firstName $lastName',
                style: Theme.of(context).textTheme.headline6),
            Text(username),
            Text(email),
            Text(contactNumber),
            Text(address),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: tiles
                  .map((tile) => Card(
                        child: ListTile(
                          title: Text(tile.title),
                          leading: Icon(tile.icon),
                          onTap: () => Navigator.pushNamed(context, tile.path),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void logout() {
    // Implement your logout functionality
    Navigator.pushReplacementNamed(context, '/login');
  }
}

class Tile {
  String title;
  String path;
  IconData icon;

  Tile({required this.title, required this.path, required this.icon});
}
