import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AllCategoryProductsPage extends StatefulWidget {
  @override
  _AllCategoryProductsPageState createState() =>
      _AllCategoryProductsPageState();
}

class _AllCategoryProductsPageState extends State<AllCategoryProductsPage> {
  List<Product> products =
      []; // Assuming Product is a model class you would define
  String category_name = '';
  String previous_route =
      '/previousRoute'; // Assume a default or fetch dynamically

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() {
    // Simulated fetch operation
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        products = List.generate(
            10,
            (index) => Product(
                  id: '$index',
                  designation: 'Product $index',
                  image: 'https://via.placeholder.com/150',
                  price: 100.0 * (index + 1),
                  discount: index % 2 == 0 ? 0.1 : 0.0,
                  rating: index % 5 + 1,
                ));
      });
    });
  }

  void viewProduct(String prodID) {
    print('Product ID: $prodID');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailsPage(prodID: prodID)));
  }

  double calculate(double price, double discount) {
    return price - (price * discount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All $category_name'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(previous_route),
        ),
      ),
      body: products.isEmpty
          ? GridView.count(
              crossAxisCount: 2,
              children: List.generate(10, (index) => SkeletonLoader()),
            )
          : GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () => viewProduct(product.id),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(product.image),
                        Text(product.designation),
                        Text('Price: ${product.price.toStringAsFixed(2)}'),
                        if (product.discount > 0)
                          Text(
                              'Discount Price: ${calculate(product.price, product.discount).toStringAsFixed(2)}'),
                        Text('Rating: ${product.rating}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class Product {
  String id;
  String designation;
  String image;
  double price;
  double discount;
  int rating;

  Product(
      {required this.id,
      required this.designation,
      required this.image,
      required this.price,
      required this.discount,
      required this.rating});
}

class ProductDetailsPage extends StatelessWidget {
  final String prodID;

  ProductDetailsPage({required this.prodID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Center(
        child: Text('Details for product $prodID'),
      ),
    );
  }
}

class SkeletonLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.grey[300],
    );
  }
}
