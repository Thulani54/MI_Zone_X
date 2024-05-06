import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MILineagePage(),
  ));
}

class MILineagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MI Lineage'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to '/mi-space' when back button is pressed
            Navigator.of(context).pushNamed('/mi-space');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate to '/mi-space' when home button is pressed
              Navigator.of(context).pushNamed('/mi-space');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 12,
        children: List.generate(12, (index) {
          if (index == 2 ||
              index == 3 ||
              index == 4 ||
              index == 5 ||
              index == 6 ||
              index == 7 ||
              index == 8 ||
              index == 9) {
            // Central columns for content
            if (index == 2 || index == 9) {
              // Empty columns at the sides of the content
              return Container();
            } else {
              // Content column
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/2c.gif'),
                    Text('Coming Soon!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Trace your lineage', style: TextStyle(fontSize: 18)),
                  ],
                ),
              );
            }
          } else {
            // Empty columns
            return Container();
          }
        }),
      ),
    );
  }
}
