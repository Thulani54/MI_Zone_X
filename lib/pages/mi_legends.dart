import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegendsPage extends StatefulWidget {
  @override
  _LegendsPageState createState() => _LegendsPageState();
}

class _LegendsPageState extends State<LegendsPage> {
  String segmentModel = 'all'; // Default segment

  final List<Map<String, dynamic>> provincialLegends = [
    {
      'image': 'https://via.placeholder.com/150',
      'first_name': 'John',
      'last_name': 'Doe',
      'province': 'Gauteng',
      'brief_history': 'Lorem ipsum dolor sit amet.'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'first_name': 'Jane',
      'last_name': 'Smith',
      'province': 'Western Cape',
      'brief_history': 'Consectetur adipiscing elit.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed('/mi-space'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pushNamed('/home'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            CupertinoButton(
              child: Text('Nominate a legend'),
              onPressed: onClick,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            CupertinoSegmentedControl<String>(
              groupValue: segmentModel,
              onValueChanged: (value) {
                setState(() {
                  segmentModel = value;
                });
              },
              children: {
                'all': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text('Legends'),
                ),
                'nominee': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text('Nominees'),
                ),
                'votingPoll': Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text('Voting Poll'),
                ),
              },
            ),
            SizedBox(height: 20),
            if (segmentModel == 'all') buildLegendsView(),
            if (segmentModel == 'nominee') buildNomineesView(),
            if (segmentModel == 'votingPoll') buildVotingPollView(),
          ],
        ),
      ),
    );
  }

  void onClick() {
    // Implement your onClick functionality here
    print('Nominate button clicked');
  }

  Widget buildLegendsView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: provincialLegends.length,
      itemBuilder: (context, index) {
        final legend = provincialLegends[index];
        return Card(
          child: ListTile(
            leading: Image.network(legend['image']),
            title: Text('${legend['first_name']} ${legend['last_name']}'),
            subtitle: Text(legend['province']),
            trailing: Text(legend['brief_history']),
          ),
        );
      },
    );
  }

  Widget buildNomineesView() {
    // Sample data and widget for nominees view
    return Text('Nominees view content here');
  }

  Widget buildVotingPollView() {
    // Sample data and widget for voting poll view
    return Text('Voting Poll view content here');
  }
}

class MiSpacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi Space')),
      body: Center(child: Text('Welcome to Mi Space!')),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Welcome Home!')),
    );
  }
}
