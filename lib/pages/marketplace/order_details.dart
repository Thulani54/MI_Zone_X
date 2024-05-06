import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // To format dates and currency

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  Map<String, dynamic> orderDetails = {
    'order_code': '123456',
    'date_timestamp': DateTime.now(),
    'status': 'Shipped',
    'order_items': [
      {
        'product_name': 'Product 1',
        'selected_attributes': 'Color: Red, Size: M',
        'quantity': 2,
        'unit_price': 29.99,
        'image': 'https://via.placeholder.com/150'
      },
    ],
    'address': {
      'street_no': '123',
      'street_name': 'Liberty St',
      'suburb': 'Central',
      'city': 'New York',
      'province': 'NY',
      'postal_code': '10005',
    },
    'payment_method': 'Credit Card',
    'used_coupon': '10% OFF',
    'total_price': 59.98,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Order No. ${orderDetails['order_code']}'),
            Text(DateFormat('yyyy-MM-dd')
                .format(orderDetails['date_timestamp'])),
            Text(orderDetails['status']),
            Text('${orderDetails['order_items'].length} item(s)'),
            ...orderDetails['order_items'].map((item) {
              return Card(
                child: Row(
                  children: [
                    Image.network(item['image'], width: 100, height: 100),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['product_name'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(item['selected_attributes']),
                          Text('Units: ${item['quantity']}'),
                          Text(
                              'Each: \$${item['unit_price'].toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            Text('Order information',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                'Shipping Address: ${orderDetails['address']['street_no']} ${orderDetails['address']['street_name']}, ${orderDetails['address']['suburb']} ${orderDetails['address']['city']}, ${orderDetails['address']['province']} ${orderDetails['address']['postal_code']}'),
            Text('Payment method: ${orderDetails['payment_method']}'),
            Text('Discount: ${orderDetails['used_coupon']}'),
            Text(
                'Total Amount: \$${orderDetails['total_price'].toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
