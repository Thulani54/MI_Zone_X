import 'package:flutter/material.dart';

class MyCartPage extends StatefulWidget {
  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<dynamic> productsInCart =
      []; // This should be filled with your cart data

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  void loadCartItems() {
    // Here you should load the products from your shopping cart service or provider
    // For demonstration, initializing with dummy data
    productsInCart = [
      {
        'id': '1',
        'designation': 'Product 1',
        'price': 29.99,
        'image': 'https://via.placeholder.com/150',
        'num': 1
      },
      {
        'id': '2',
        'designation': 'Product 2',
        'price': 59.99,
        'image': 'https://via.placeholder.com/150',
        'num': 2
      },
    ];
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (productsInCart[index]['num'] > 1) {
        productsInCart[index]['num']--;
      }
    });
  }

  void increaseQuantity(int index) {
    setState(() {
      productsInCart[index]['num']++;
    });
  }

  void removeProduct(int index) {
    setState(() {
      productsInCart.removeAt(index);
    });
  }

  void emptyCart() {
    setState(() {
      productsInCart = [];
    });
  }

  double calcTotalPrice() {
    return productsInCart.fold(
        0, (total, current) => total + current['price'] * current['num']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart Items'),
        leading: BackButton(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: productsInCart.isEmpty
          ? Center(
              child: Text('Your Cart is Empty.'),
            )
          : ListView.builder(
              itemCount: productsInCart.length,
              itemBuilder: (context, index) {
                final product = productsInCart[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(product['image']),
                    title: Text(product['designation']),
                    subtitle: Text('\$${product['price']} x ${product['num']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => decreaseQuantity(index),
                        ),
                        Text(product['num'].toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => increaseQuantity(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            Text('Total: \$${calcTotalPrice().toStringAsFixed(2)}'),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
