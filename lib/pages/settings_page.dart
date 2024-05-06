import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SettingsPage(),
  ));
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool enableNotifications = false;
  String selectedTheme = 'default';
  bool loggedIn =
      false; // This would typically be determined by your app's login system

  List<Map<String, String>> themeColors = [
    {'name': 'Default', 'class': 'default'},
    {'name': 'Dark', 'class': 'dark-theme'},
    {'name': 'Purple', 'class': 'purple'},
    {'name': 'Medium', 'class': 'mediumTheme'}
  ];

  @override
  void initState() {
    super.initState();
    // Listen for login events or similar
    // This method will depend on your actual authentication and state management setup
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Change the navigation based on login state
            Navigator.of(context)
                .pushReplacementNamed(loggedIn ? '/user-profile' : '/home');
          },
        ),
        title: Text('MI-App Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Enable notifications',
                style: TextStyle(color: Colors.blue)),
            trailing: Switch(
              value: enableNotifications,
              onChanged: (bool value) {
                setState(() {
                  enableNotifications = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Select Theme'),
            trailing: DropdownButton<String>(
              value: selectedTheme,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTheme = newValue!;
                  dynamicTheme(newValue);
                });
              },
              items: themeColors
                  .map<DropdownMenuItem<String>>((Map<String, String> theme) {
                return DropdownMenuItem<String>(
                  value: theme['class'],
                  child: Text(theme['name']!),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void dynamicTheme(String? themeName) {
    // Here you would apply the theme using your ThemeService or similar
    print('Theme changed to: $themeName');
  }
}
