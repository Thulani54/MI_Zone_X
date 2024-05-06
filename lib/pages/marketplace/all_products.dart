import 'package:flutter/material.dart';

class AllProductsPage extends StatefulWidget {
  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  List<Product> products = []; // Mock data
  String filterTerm = '';
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
    // This is where you'd fetch data from your backend or service.
    setState(() {
      products = List.generate(
        20,
        (index) => Product(
          id: '$index',
          designation: 'Product $index',
          image: 'https://via.placeholder.com/150',
          price: 99.99,
          discount: index % 2 == 0 ? 0.1 : 0.0,
          rating: index % 5 + 1.0,
        ),
      );
    });
  }

  double calculateDiscountedPrice(double price, double discount) {
    return price - (price * discount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        leading: BackButton(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {}, // Link to cart page
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Your Product',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  filterTerm = value;
                });
              },
            ),
          ),
          Expanded(
            child: products.isEmpty
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: 10,
                    itemBuilder: (_, index) => SkeletonLoader(),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: products.length,
                    itemBuilder: (_, index) {
                      final product = products[index];
                      if (!product.designation
                          .toLowerCase()
                          .contains(filterTerm.toLowerCase())) {
                        return Container();
                      }
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetailsPage(product: product))),
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.network(product.image,
                                      fit: BoxFit.cover)),
                              Text(product.designation),
                              Text('\$${product.price.toStringAsFixed(2)}'),
                              if (product.discount > 0)
                                Text(
                                    '\$${calculateDiscountedPrice(product.price, product.discount).toStringAsFixed(2)}',
                                    style: TextStyle(color: Colors.red)),
                              Icon(Icons.star,
                                  color: product.rating >= 5
                                      ? Colors.yellow
                                      : Colors.grey),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String id;
  final String designation;
  final String image;
  final double price;
  final double discount;
  final double rating;

  Product(
      {required this.id,
      required this.designation,
      required this.image,
      required this.price,
      required this.discount,
      required this.rating});
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.designation),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(product.image),
            Text('\$${product.price.toStringAsFixed(2)}'),
            if (product.discount > 0)
              Text(
                  '\$${(product.price - (product.price * product.discount)).toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.red)),
            Text('Rating: ${product.rating}'),
          ],
        ),
      ),
    );
  }
}

class SkeletonLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.grey[300],
      height: 200,
      width: double.infinity,
    );
  }
}
