import 'package:flutter/material.dart';

class ParlourProductDetailsPage extends StatefulWidget {
  @override
  _ParlourProductDetailsPageState createState() =>
      _ParlourProductDetailsPageState();
}

class _ParlourProductDetailsPageState extends State<ParlourProductDetailsPage> {
  String previousRoute = "";
  List<dynamic> items = [];
  Map<String, dynamic> parlourInfo = {};
  List<dynamic> productTypes = [];
  bool automaticClose = false;
  List<Color> colors = [Colors.grey[300]!, Colors.grey[200]!];

  @override
  void initState() {
    super.initState();
    loadParlourData();
  }

  void loadParlourData() {
    // Simulating data fetch
    setState(() {
      previousRoute = "/previous-route"; // Example previous route
      items = [
        {
          'product_type': 'Funeral Cover',
          'min_rate': 100,
          'open': false,
          'product_type_categories': ['Basic', 'Premium']
        },
        {
          'product_type': 'Life Insurance',
          'min_rate': 150,
          'open': false,
          'product_type_categories': ['Standard', 'Gold']
        }
      ];
    });
  }

  Color getColors(int index) {
    return colors[index % colors.length];
  }

  void toggleSection(int index) {
    setState(() {
      items[index]['open'] = !items[index]['open'];
      if (automaticClose) {
        for (int i = 0; i < items.length; i++) {
          if (i != index) {
            items[i]['open'] = false;
          }
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, previousRoute),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return ExpansionPanelList(
            expansionCallback: (int panelIndex, bool isExpanded) {
              toggleSection(index);
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item['product_type']),
                    subtitle: Text("From R${item['min_rate']} per month"),
                  );
                },
                body: Column(
                  children:
                      item['product_type_categories'].map<Widget>((category) {
                    return ListTile(
                      title: Text(category),
                      onTap: () => print("Tapped on $category"),
                    );
                  }).toList(),
                ),
                isExpanded: item['open'],
              ),
            ],
          );
        },
      ),
    );
  }
}
