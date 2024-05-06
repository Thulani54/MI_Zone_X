import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String filterTerm = '';
  List<dynamic> filteredProducts = [];
  List<dynamic> products = [
    {
      'product_type': 'Life Insurance',
      'client_name': 'Parlour A',
      'rate': 500.00,
      'cover_amount': 200000,
      'benefits': ['Benefit 1', 'Benefit 2'],
      'visible': false,
    },
    {
      'product_type': 'Funeral Cover',
      'client_name': 'Parlour B',
      'rate': 300.00,
      'cover_amount': 50000,
      'benefits': ['Benefit 3', 'Benefit 4'],
      'visible': false,
    }
  ];

  TextEditingController _filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void showHide(dynamic product) {
    setState(() {
      product['visible'] = !product['visible'];
    });
  }

  void buyProduct(int index) {
    // Implement your buy product functionality
    print('Buying product ${filteredProducts[index]}');
  }

  void viewQuoteDetails(String clientName) {
    // Navigation or further logic to view more products from the selected parlour
    print('View more products from $clientName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement your navigation logic here
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _filterController,
                decoration: InputDecoration(
                  labelText: 'Search...',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    filterTerm = value;
                    filteredProducts = products
                        .where((prod) => prod['product_type']
                            .toLowerCase()
                            .contains(filterTerm.toLowerCase()))
                        .toList();
                  });
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                var prod = filteredProducts[index];
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(prod['product_type']),
                        subtitle: Text('Parlour: ${prod['client_name']}'),
                        trailing: IconButton(
                          icon: Icon(prod['visible']
                              ? Icons.expand_less
                              : Icons.expand_more),
                          onPressed: () => showHide(prod),
                        ),
                      ),
                      Visibility(
                        visible: prod['visible'],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                  'Premium pm: R${prod['rate'].toStringAsFixed(2)}'),
                              Text(
                                  'Cover amount: R${prod['cover_amount'].toStringAsFixed(2)}'),
                              Column(
                                children: prod['benefits']
                                    .map<Widget>((benefit) => Text(benefit))
                                    .toList(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => buyProduct(index),
                                    child: Text('Buy'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        viewQuoteDetails(prod['client_name']),
                                    child: Text('View More'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  int year = DateTime.now().year;
  String clientId = '1';

  String text = 'View Benefits';
  List<dynamic> possibleCovers = [];
  List<dynamic> ratesList = [];

  List<dynamic> possibleProducts = [];

  dynamic parlourID;

  final List<dynamic> priceFilter = [
    {'TagId': 20, 'Type': 'Budget', 'Value': 5000, 'DisplayText': 'R5,000.00'},
    {
      'TagId': 20,
      'Type': 'Budget',
      'Value': 10000,
      'DisplayText': 'R10,000.00'
    },
    {
      'TagId': 20,
      'Type': 'Budget',
      'Value': 15000,
      'DisplayText': 'R15,000.00'
    },
  ];

  final List<dynamic> locationFilter = [
    {
      'TagId': 1,
      'Type': 'Location',
      'DisplayText': 'Eastern Cape',
      'Value': 'Eastern Cape'
    },
    {
      'TagId': 2,
      'Type': 'Location',
      'DisplayText': 'Free State',
      'Value': 'Free State'
    },
    // Add other locations similarly
  ];

  final List<dynamic> minPriceFilter = [
    {'TagId': 20, 'Type': 'MinPrice', 'Value': 15, 'DisplayText': 'R15'},
    // Add other min prices similarly
  ];

  final List<dynamic> maxPriceFilter = [
    {'TagId': 20, 'Type': 'MaxPrice', 'Value': 10, 'DisplayText': 'R10'},
    // Add other max prices similarly
  ];

  // Simulate fetching data from an API or database
  void initialize() {
    // Example of setting up data
    possibleCovers = [
      {
        'amount': 10000,
        'premium': 500,
        'min_age': 18,
        'max_age': 45,
        'number_of_members': 3
      }
      // Add other possible covers similarly
    ];

    // Normally you would fetch these values from an API
    fetchRates();
  }

  void fetchRates() {
    // Simulating fetching rates data
    ratesList = [
      {
        'amount': 5000,
        'premium': 250,
        'min_age': 18,
        'max_age': 45,
        'number_of_members': 3
      }
      // Add other rate details similarly
    ];
  }

  void calculateFilteredProducts() {
    // Implement filtering logic based on conditions provided by form controls
  }

  dynamic getValue(int index) {
    if (index == 0) {
      return {
        'lower': 0,
        'displayText': priceFilter[index]['DisplayText'],
        'upper': priceFilter[index]['Value']
      };
    } else {
      return {
        'lower': priceFilter[index - 1]['Value'],
        'upper': priceFilter[index]['Value'],
        'displayText':
            '${priceFilter[index - 1]['DisplayText']} - ${priceFilter[index]['DisplayText']}',
      };
    }
  }

  dynamic getMinValue(int index) {
    if (index == 0) {
      return {
        'lower': 0,
        'displayText': minPriceFilter[index]['DisplayText'],
        'upper': minPriceFilter[index]['Value']
      };
    } else {
      return {
        'lower': minPriceFilter[index - 1]['Value'],
        'upper': minPriceFilter[index]['Value'],
        'displayText': minPriceFilter[index]['DisplayText'],
      };
    }
  }

  dynamic getMaxValue(int index) {
    if (index == 0) {
      return {
        'lower': 0,
        'displayText': maxPriceFilter[index]['DisplayText'],
        'upper': maxPriceFilter[index]['Value']
      };
    } else {
      return {
        'lower': maxPriceFilter[index - 1]['Value'],
        'upper': maxPriceFilter[index]['Value'],
        'displayText': maxPriceFilter[index]['DisplayText'],
      };
    }
  }

  dynamic getLocationValue(int index) {
    if (index == 0) {
      return {
        'lower': 0,
        'displayText': locationFilter[index]['DisplayText'],
        'upper': locationFilter[index]['Value']
      };
    } else {
      return {
        'upper': locationFilter[index]['Value'],
        'displayText': locationFilter[index]['DisplayText'],
      };
    }
  }
}
