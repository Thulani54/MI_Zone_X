import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MaterialApp(
    home: ViewFuneralProgramsPage(),
  ));
}

class ViewFuneralProgramsPage extends StatefulWidget {
  @override
  _ViewFuneralProgramsPageState createState() =>
      _ViewFuneralProgramsPageState();
}

class _ViewFuneralProgramsPageState extends State<ViewFuneralProgramsPage> {
  List<Map<String, dynamic>> programList = [
    {
      'id': '1',
      'first_name': 'John',
      'last_name': 'Doe',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'id': '2',
      'first_name': 'Jane',
      'last_name': 'Doe',
      'image': 'https://via.placeholder.com/150',
    }
  ];

  void openModal(Map<String, dynamic> funProgram) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${funProgram['first_name']} ${funProgram['last_name']}"),
          content: Text("Details about the funeral program..."),
        );
      },
    );
  }

  void shareFuneralProgram(
      String funeralId, String firstName, String lastName) {
    final String sharingLink = 'https://example.com/funeral-program/$funeralId';
    final String message = 'In loving memory of $firstName $lastName';
    final String subject = 'Funeral program of $firstName $lastName';

    Share.share('$message\n\n$sharingLink', subject: subject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        title: Text('Funeral Programs'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/create-funeral-program'),
              child: Text('Create a Funeral Program'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: programList.length,
                itemBuilder: (context, index) {
                  final item = programList[index];
                  return ListTile(
                    leading: GestureDetector(
                      onTap: () => openModal(item),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(item['image']),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () => openModal(item),
                      child: Text('${item['first_name']} ${item['last_name']}'),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.red),
                          onPressed: () =>
                              openModal(item), // Placeholder for editModal
                        ),
                        IconButton(
                          icon: Icon(Icons.share, color: Colors.blue),
                          onPressed: () => shareFuneralProgram(item['id'],
                              item['first_name'], item['last_name']),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
