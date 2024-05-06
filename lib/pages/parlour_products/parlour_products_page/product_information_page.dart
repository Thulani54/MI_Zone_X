import 'package:flutter/material.dart';

class ProductInformationPage extends StatefulWidget {
  @override
  _ProductInformationPageState createState() => _ProductInformationPageState();
}

class _ProductInformationPageState extends State<ProductInformationPage> {
  String previousRoute = "";
  String parlourName = "";
  String productName = "";
  String planType = "";
  List<String> planBenefits = [];
  // Assuming these are initialized somewhere in your app
  final Map<String, String> imagePaths = {
    'Bronze': 'assets/images/bronze.png',
    'Silver': 'assets/images/silver.png',
    'Gold': 'assets/images/gold.png',
    'Platinum': 'assets/images/platinum.png',
    'Other': 'assets/images/other.png',
  };

  @override
  void initState() {
    super.initState();
    previousRoute = '/previous-route'; // Example, set based on your app logic
    planType = 'Gold'; // Example, this would be set based on your app logic
    planBenefits = ['Benefit 1', 'Benefit 2', 'Benefit 3']; // Example benefits
  }

  void buyProduct() {
    // Implement your buy product logic here
    Navigator.of(context).pushNamed('/buy-product');
  }

  void rateProduct() {
    // Implement your rate product logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rate Product'),
          content: Text('How do you feel about $productName?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(productName ?? 'Product Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child:
                      Image.asset(imagePaths[planType] ?? imagePaths['Other']!),
                ),
                Expanded(
                  flex: 8,
                  child: Text('Product Type: $planType',
                      style: Theme.of(context).textTheme.headline6),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: planBenefits.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(planBenefits[index]),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      drawer: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text('Buy'),
              // color: Colors.lightBlue,
              onPressed: buyProduct,
            ),
          ),
          Expanded(
            child: ElevatedButton(
              child: Text('Rate Product'),
              //  color: Colors.green,
              onPressed: rateProduct,
            ),
          ),
        ],
      ),
    );
  }
}
