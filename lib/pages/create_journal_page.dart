import 'package:flutter/material.dart';

class MIJournalPage extends StatefulWidget {
  @override
  _MIJournalPageState createState() => _MIJournalPageState();
}

class _MIJournalPageState extends State<MIJournalPage> {
  String segmentModel = 'journal';
  List<Map<String, dynamic>> journalEntries = [
    {
      'journal_title': 'Entry One',
      'journal_image': 'path/to/image',
      'date_timestamp': '2021-09-01',
      'entry_placeholder': 'Some text...',
      'favorite': true,
      'id': '1',
    },
    // Add more entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MI Journal'),
        leading: BackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushNamed(context, '/mi-space'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _buildSegmentControl(),
            if (segmentModel == 'journal') _buildJournalEntries(),
            if (segmentModel == 'favorites') _buildFavoriteEntries(),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentControl() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    segmentModel == 'journal' ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  segmentModel = 'journal';
                });
              },
              child: Text('All Journals'),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return segmentModel == 'favorites'
                        ? Colors.blue
                        : Colors.grey;
                  },
                ),
              ),
              onPressed: () {
                setState(() {
                  segmentModel = 'favorites';
                });
              },
              child: Text('MI Favourite'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJournalEntries() {
    return Column(
      children: journalEntries.map((entry) {
        return Card(
          child: Column(
            children: <Widget>[
              if (entry['journal_image'] != '')
                Image.network(entry['journal_image']),
              ListTile(
                title: Text(entry['journal_title']),
                subtitle: Text(entry['date_timestamp']),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(entry['entry_placeholder']),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      entry['favorite'] ? Icons.star : Icons.star_border,
                    ),
                    onPressed: () {
                      // Add logic to handle favorite toggle
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Add logic to handle edit
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFavoriteEntries() {
    return Column(
      children: journalEntries.where((entry) => entry['favorite']).map((entry) {
        return Card(
          child: Column(
            children: <Widget>[
              if (entry['journal_image'] != '')
                Image.network(entry['journal_image']),
              ListTile(
                title: Text(entry['journal_title']),
                subtitle: Text(entry['date_timestamp']),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(entry['entry_placeholder']),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      entry['favorite'] ? Icons.star : Icons.star_border,
                    ),
                    onPressed: () {
                      // Add logic to remove from favorites
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Add logic to handle edit
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String appUserId = "";

  bool isFavorite = false;

  String segmentModel2 = "all";
  String journalId = "";
  String entryParagraph = "";
  List<dynamic> favorites = [];
  dynamic dataReturned;
  Map<String, dynamic> editEntry = {
    "app_user_id": "",
    "journal_id": "",
    "journal_title": "",
    "journal_entry": "",
    "journal_image": "",
    "favorite": false,
  };

  @override
  void initState() {
    super.initState();
    getJournalDetails();
    // Assume userData.getUserDetails() is fetched here and sets appUserId
  }

  void getJournalDetails() {
    // Simulated fetch request
    journalEntries = [
      {
        "id": "1",
        "journal_title": "Title 1",
        "journal_entry": "Long journal entry...",
        "favorite": false,
        "journal_image": "path_to_image",
      },
      // Additional entries can be added here
    ];
    setState(() {});
  }

  void viewEntry(String id) {
    var entry =
        journalEntries.firstWhere((e) => e['id'] == id, orElse: () => {});
    if (entry != null) {
      setState(() {
        entry['entry_placeholder'] =
            entry['entry_placeholder'] == entry['summarized_entry']
                ? entry['journal_entry']
                : entry['summarized_entry'];
      });
    }
  }

  void toggleFavorite(Map<String, dynamic> journalEntry) {
    setState(() {
      journalEntry['favorite'] = !journalEntry['favorite'];
      // Further implementation would involve actual data update calls
    });
  }

  Widget journalCard(Map<String, dynamic> entry) {
    return Card(
      child: Column(
        children: [
          if (entry['journal_image'] != null)
            Image.network(entry['journal_image']),
          ListTile(
            title: Text(entry['journal_title']),
            subtitle: Text('Subtitle here'), // Placeholder for actual data
            trailing: IconButton(
              icon: Icon(entry['favorite'] ? Icons.star : Icons.star_border),
              onPressed: () => toggleFavorite(entry),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(entry['journal_entry']),
          ),
          TextButton(
            onPressed: () => viewEntry(entry['id']),
            child: Text('View More'),
          ),
        ],
      ),
    );
  }
}
