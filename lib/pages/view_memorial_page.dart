import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MemorialPage()));

class MemorialPage extends StatefulWidget {
  @override
  _MemorialPageState createState() => _MemorialPageState();
}

class _MemorialPageState extends State<MemorialPage> {
  String queryText = '';
  bool showSearchbar = false;
  String segmentModel = 'all-post';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: showSearchbar ? buildSearchBar() : Text('Memorial'),
        actions: [
          if (!showSearchbar)
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  showSearchbar = true;
                });
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildSegmentControl(),
            if (segmentModel == 'all-post') buildAllPostsView(),
            // Add more conditions for other segments
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search...',
        suffixIcon: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              showSearchbar = false;
            });
          },
        ),
      ),
      onChanged: (value) {
        setState(() {
          queryText = value;
        });
      },
    );
  }

  Widget buildSegmentControl() {
    return CupertinoSegmentedControl<String>(
      children: {
        'all-post': Text('All Post'),
        'mi-post': Text('MI Post'),
        'mi-friends-post': Text('MI Friends Post'),
      },
      onValueChanged: (value) {
        setState(() {
          segmentModel = value;
        });
      },
      groupValue: segmentModel,
    );
  }

  Widget buildAllPostsView() {
    return Center(
      child: Text('Content for All Post'),
      // Implement the details according to your data structure
    );
  }

// Additional methods to build views for other segments
}
