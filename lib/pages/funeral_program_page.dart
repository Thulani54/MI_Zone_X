import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FuneralProgramPage extends StatefulWidget {
  final dynamic funPro; // Assuming funPro is passed as a parameter to the route

  FuneralProgramPage({this.funPro});

  @override
  _FuneralProgramPageState createState() => _FuneralProgramPageState();
}

class _FuneralProgramPageState extends State<FuneralProgramPage> {
  String sharingLink = "";

  @override
  void initState() {
    super.initState();
  }

  void shareFuneralProgram(
      String funeralId, String firstName, String lastName) {
    print('Share funeral');
    print('id on button: $funeralId');
    sharingLink =
        'https://mi-zone-shared-qa.web.app/funeral-program/$funeralId';
    String message = 'In loving memory of $firstName $lastName';
    String subject = 'Funeral program of $firstName $lastName';

    // Share.share(message, subject: subject, url: sharingLink);
    Share.share(message, subject: subject + sharingLink);
  }

  void dismiss() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funeral Program'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: dismiss,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => shareFuneralProgram(widget.funPro['id'],
                widget.funPro['first_name'], widget.funPro['last_name']),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.funPro['headline'] ?? ''),
                    subtitle: Text(
                        '${widget.funPro['first_name']} ${widget.funPro['last_name']}'),
                  ),
                  Image.network(widget.funPro['image']),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('${widget.funPro['obituary']}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Acknowledgement: ${widget.funPro['acknowledgement_message']}'),
                  ),
                ],
              ),
            ),
            // Other cards can be added here in a similar fashion
          ],
        ),
      ),
    );
  }
}
