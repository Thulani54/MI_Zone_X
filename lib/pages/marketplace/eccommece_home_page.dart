import 'package:flutter/material.dart';

class EcommerceHomePage extends StatefulWidget {
  @override
  _EcommerceHomePageState createState() => _EcommerceHomePageState();
}

class _EcommerceHomePageState extends State<EcommerceHomePage> {
  List<Map<String, dynamic>> categories = [];
  List<Map<String, dynamic>> allCategories = [];
  List<Map<String, dynamic>> featuredProducts = [];
  List<Map<String, dynamic>> bestSellProducts = [];
  List<Map<String, dynamic>> products = [];
  String filterTerm = '';
  int cartLength = 0;

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchProducts();
  }

  void fetchCategories() {
    // Simulate fetching categories
    categories = [
      {
        'id': '1',
        'designation': 'Electronics',
        'image': 'https://via.placeholder.com/150'
      },
      {
        'id': '2',
        'designation': 'Books',
        'image': 'https://via.placeholder.com/150'
      },
      // Add more categories
    ];
  }

  void fetchProducts() {
    // Simulate fetching products
    featuredProducts = [
      {
        'id': '1',
        'designation': 'Laptop',
        'price': 1500,
        'image': 'https://via.placeholder.com/150'
      },
      {
        'id': '2',
        'designation': 'Smartphone',
        'price': 999,
        'image': 'https://via.placeholder.com/150'
      },
      // Add more products
    ];
    bestSellProducts = [
      {
        'id': '3',
        'designation': 'Headphones',
        'price': 250,
        'image': 'https://via.placeholder.com/150'
      },
      {
        'id': '4',
        'designation': 'Keyboard',
        'price': 75,
        'image': 'https://via.placeholder.com/150'
      },
      // Add more products
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/my-cart'); // Navigate to cart page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filterTerm = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search Your Product',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            categorySection(),
            productSection('Featured', featuredProducts),
            productSection('Best Sell', bestSellProducts),
          ],
        ),
      ),
    );
  }

  Widget categorySection() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return categoryCard(categories[index]);
        },
      ),
    );
  }

  Widget productSection(String title, List<Map<String, dynamic>> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return productCard(productList[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget categoryCard(Map<String, dynamic> category) {
    return GestureDetector(
      onTap: () {
        // Navigate to category products
      },
      child: Card(
        child: Column(
          children: [
            Image.network(category['image'], width: 100, height: 60),
            Text(category['designation']),
          ],
        ),
      ),
    );
  }

  Widget productCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        // Navigate to product details
      },
      child: Card(
        child: Column(
          children: [
            Image.network(product['image'], width: 100, height: 100),
            Text(product['designation']),
            Text('\$${product['price']}',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
