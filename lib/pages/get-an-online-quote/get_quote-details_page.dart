import 'package:flutter/material.dart';

class MyQuotePage extends StatefulWidget {
  @override
  _MyQuotePageState createState() => _MyQuotePageState();
}

class _MyQuotePageState extends State<MyQuotePage> {
  List<Map<String, dynamic>> priceFilter = [
    {'Value': 5000, 'DisplayText': 'R5,000.00'},
    {'Value': 10000, 'DisplayText': 'R10,000.00'},
    {'Value': 15000, 'DisplayText': 'R15,000.00'},
  ];

  List<Map<String, dynamic>> minPriceFilter = [
    {'Value': 10001, 'DisplayText': 'R10,001'},
    {'Value': 15001, 'DisplayText': 'R15,001'},
    {'Value': 20001, 'DisplayText': 'R20,001'},
  ];

  List<Map<String, dynamic>> maxPriceFilter = [
    {'Value': 10000, 'DisplayText': 'R10,000'},
    {'Value': 15000, 'DisplayText': 'R15,000'},
    {'Value': 20000, 'DisplayText': 'R20,000'},
  ];

  List<Map<String, dynamic>> locationFilter = [
    {'Value': 'Eastern Cape', 'DisplayText': 'Eastern Cape'},
    // Add other locations similarly
  ];

  Map<String, dynamic> getValue(int index) {
    if (index == 0) {
      return {
        'lower': 0,
        'displayText': priceFilter[index]['DisplayText'],
        'upper': priceFilter[index]['Value'],
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

  Map<String, dynamic> getMinValue(int index) {
    if (index == 0) {
      return {
        'lower': 0,
        'displayText': minPriceFilter[index]['DisplayText'],
        'upper': minPriceFilter[index]['Value'],
      };
    } else {
      return {
        'lower': minPriceFilter[index - 1]['Value'],
        'upper': minPriceFilter[index]['Value'],
        'displayText': minPriceFilter[index]['DisplayText'],
      };
    }
  }

  Map<String, dynamic> getMaxValue(int index) {
    if (index == 0) {
      return {
        'lower': 0,
        'displayText': maxPriceFilter[index]['DisplayText'],
        'upper': maxPriceFilter[index]['Value'],
      };
    } else {
      return {
        'lower': maxPriceFilter[index - 1]['Value'],
        'upper': maxPriceFilter[index]['Value'],
        'displayText': maxPriceFilter[index]['DisplayText'],
      };
    }
  }

  Map<String, dynamic> getLocationValue(int index) {
    if (index == 0) {
      return {
        'lower': 0,
        'displayText': locationFilter[index]['DisplayText'],
        'upper': locationFilter[index]['Value'],
      };
    } else {
      return {
        'upper': locationFilter[index]['Value'],
        'displayText': locationFilter[index]['DisplayText'],
      };
    }
  }

  final List<String> priceFilters = [
    'Under \$50',
    'Under \$100',
    'Under \$200',
    'Under \$500',
  ];
  final List<String> locationFilters = [
    'Local',
    'Regional',
    'National',
    'International'
  ];
  String selectedPriceFilter = '';
  String selectedLocationFilter = '';
  List<int> productPrices = List<int>.generate(100, (i) => i * 10);
  List<int> filteredProductPrices = [];
  DateTime dateOfBirth = DateTime.now();
  int year = DateTime.now().year;
  List<Map<String, dynamic>> priceFilter2 = [
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
  List<Map<String, dynamic>> locationFilter2 = [
    {
      'TagId': 1,
      'Type': 'Location',
      'DisplayText': 'Eastern Cape',
      'Value': 'Eastern Cape'
    },
    // Add other locations similarly
  ];
  // Assuming possibleProducts are just a list of prices for simplicity
  List<int> possibleProducts = [];
  List<int> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    loadInitialData();
    filteredProductPrices = productPrices;
  }

  void loadInitialData() {
    // Normally you'd load this data from an API or service
    setState(() {
      possibleProducts = [5000, 10000, 15000];
      filteredProducts = List.from(possibleProducts);
    });
  }

  void filterProducts(String query) {
    setState(() {
      filteredProductPrices = productPrices
          .where((price) => price.toString().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('My Orders'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset('assets/logos/1.png'),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: filterProducts,
              decoration: InputDecoration(
                labelText: 'Search cover amount...',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            ExpansionPanelList.radio(
              children: [
                ExpansionPanelRadio(
                  value: 'panel1',
                  headerBuilder: (_, isExpanded) => ListTile(
                    title: Text('Filter'),
                  ),
                  body: Column(
                    children: [
                      buildDropdown(
                          'Price Range', priceFilters, selectedPriceFilter,
                          (String? newValue) {
                        setState(() {
                          selectedPriceFilter = newValue!;
                        });
                      }),
                      buildDropdown(
                          'Location', locationFilters, selectedLocationFilter,
                          (String? newValue) {
                        setState(() {
                          selectedLocationFilter = newValue!;
                        });
                      }),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: filteredProductPrices.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => print(
                      'View quote details for: ${filteredProductPrices[index]}'),
                  child: Card(
                    child: Center(
                      child: Text('\$${filteredProductPrices[index]}'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> options, String currentValue,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: currentValue.isEmpty ? null : currentValue,
          isExpanded: true,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text('-- Select $label --'),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
