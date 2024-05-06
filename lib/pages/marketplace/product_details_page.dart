import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final productDetails; // Assume this is being passed or fetched from a model/service
  final List productImages;
  final List productReviews;

  ProductDetailPage(
      {this.productDetails,
      required this.productImages,
      required this.productReviews});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late final String productId;
  bool isReadMore = true;
  String activeVariation = 'size';
  int? selectedSize;
  int? selectedColor;
  List<dynamic> sizes = [];
  List<dynamic> colors = [];
  List<dynamic> productImages = [];
  List<dynamic> productReviews = [];
  dynamic productDetails;
  bool showShortDescription = true;

  @override
  void initState() {
    super.initState();
    // productId = widget.productId;
    getProductInformation();
    getProductImages();
    getProductReviews();
  }

  void getProductInformation() {
    // Fetch product information from an API or a local store
  }

  void getProductImages() {
    // Fetch product images from an API or a local store
  }

  void getProductReviews() {
    // Fetch product reviews from an API or a local store
  }

  void toggleDescription() {
    setState(() {
      isReadMore = !isReadMore;
    });
  }

  void changeVariation(String variation) {
    setState(() {
      activeVariation = variation;
    });
  }

  void selectSize(int index, String value) {
    setState(() {
      selectedSize = index;
      // Add additional logic as required
    });
  }

  void selectColor(int index, String value) {
    setState(() {
      selectedColor = index;
      // Add additional logic as required
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Implement favorite functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart page
              Navigator.pushNamed(context, '/my-cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  Image.network(productDetails['image']),
                  ...productImages
                      .map((img) => Image.network(img['image']))
                      .toList(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productDetails['designation'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    productDetails['sale_price'] > 0
                        ? 'R${productDetails['sale_price']} (R${productDetails['price']})'
                        : 'R${productDetails['price']}',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(productDetails['short_description']),
                  Divider(),
                  Text(
                    'Product Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  ...productDetails['tags']
                      .map((tag) => Chip(label: Text(tag))),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                child: Text('Add to Cart'),
                onPressed: () {
                  // Add to cart functionality
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: Text('Buy Now'),
                onPressed: () {
                  // Direct buy functionality
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
