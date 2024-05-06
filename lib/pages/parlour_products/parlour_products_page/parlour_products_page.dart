import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String previousRoute = "";
  String parlourName = "";
  List<dynamic> categories = [];
  String category = "";
  double minRate = 100;
  List<dynamic> items = [];
  bool automaticClose = false;
  List<dynamic> allItems = [];
  Map<String, dynamic> values = {};

  final List<Color> colors = [Color(0xFFadb5bd), Color(0xFFced4da)];

  @override
  void initState() {
    super.initState();
    previousRoute = "/previous"; // Adjust based on your app's routing
    getParlourInfo();
  }

  Color getColors(int index) {
    return colors[index % colors.length];
  }

  void getParlourInfo() {
    // Simulate fetching data
    setState(() {
      parlourName = "Sample Parlour";
      items = [
        {
          "product_type": "Type A",
          "min_rate": 200,
          "open": false,
          "product_type_categories": ["Category 1", "Category 2"],
        },
        {
          "product_type": "Type B",
          "min_rate": 300,
          "open": false,
          "product_type_categories": ["Category 3", "Category 4"],
        }
      ];
    });
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

  void viewDetail(String productType, dynamic child, int index) {
    // Implement navigation to detail or other actions
    print('View detail for $productType, $child at $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(parlourName ?? "Product Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return Card(
            color: getColors(index),
            child: ExpansionTile(
              initiallyExpanded: item['open'],
              title:
                  Text('${item['product_type']} From ${item['min_rate']} p/m'),
              leading: Icon(
                  item['open'] ? Icons.arrow_downward : Icons.arrow_forward),
              children: item['product_type_categories'].map<Widget>((child) {
                return ListTile(
                  title: Text(child),
                  onTap: () => viewDetail(item['product_type'], child, index),
                );
              }).toList(),
              onExpansionChanged: (bool expanded) {
                if (expanded) toggleSection(index);
              },
            ),
          );
        },
      ),
    );
  }
}
