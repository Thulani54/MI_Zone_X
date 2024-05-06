import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MiBioPage()));
}

class MiBioPage extends StatefulWidget {
  @override
  _MiBioPageState createState() => _MiBioPageState();
}

class _MiBioPageState extends State<MiBioPage> {
  List<dynamic> myBio = []; // This would typically be fetched from an API
  int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MI Bio'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/mi-space'); // Adjust route as needed
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/mi-space'); // Adjust route as needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: myBio.isNotEmpty ? buildBioList() : buildAddBioButton(),
      ),
    );
  }

  Widget buildBioList() {
    return ListView.builder(
      itemCount: myBio.length,
      itemBuilder: (context, index) {
        var cd = myBio[index];
        return Card(
          child: Column(
            children: <Widget>[
              if (cd['profile_image'] != '')
                Image.network(cd['profile_image']), // Assuming images are URLs
              Text(cd['bio_headline'] ?? ''),
              Text(
                  '${currentYear - int.parse(cd['date_of_birth'].substring(0, 4))} years old'),
              Text(cd['date_of_birth']),
              Text(cd['bio_description'] ?? ''),
              ElevatedButton.icon(
                icon: Icon(Icons.edit),
                label: Text('Edit Bio'),
                onPressed: () => openEditModal(cd),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddBioButton() {
    return Center(
      child: ElevatedButton.icon(
        icon: Icon(Icons.add),
        label: Text('Add Bio'),
        onPressed: openModal,
      ),
    );
  }

  void openEditModal(dynamic cd) {
    // Implementation depends on how you manage modal dialogs in Flutter
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Bio'),
          content: Text('Edit functionality to be implemented.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void openModal() {
    // Implementation depends on how you manage modal dialogs in Flutter
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Bio'),
          content: Text('Add functionality to be implemented.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
