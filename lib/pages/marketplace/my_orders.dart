import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  List<dynamic> allOrders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() {
    // Assuming you fetch data from an API or local storage and parse JSON
    allOrders = [
      {
        'order_code': '123456',
        'date_timestamp': DateTime.now().subtract(Duration(days: 1)),
        'order_items': List.filled(5, {}),
        'total_price': 150.00,
        'id': '1',
        'status': 'Delivered'
      },
      {
        'order_code': '654321',
        'date_timestamp': DateTime.now(),
        'order_items': List.filled(3, {}),
        'total_price': 90.00,
        'id': '2',
        'status': 'Processing'
      },
    ];

    // Simulating sorting by date
    allOrders
        .sort((a, b) => b['date_timestamp'].compareTo(a['date_timestamp']));
  }

  void viewOrder(String orderId) {
    // Navigate to order details page
    print('View order details for $orderId');
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrderDetailsPage(orderId: orderId)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
        title: Text('My Orders'),
      ),
      body: allOrders.isNotEmpty
          ? ListView.builder(
              itemCount: allOrders.length,
              itemBuilder: (context, index) {
                var order = allOrders[index];
                return Card(
                  child: ListTile(
                    title: Text('Order No. ${order['order_code']}'),
                    subtitle: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Quantity: ${order['order_items'].length}'),
                            Text(
                                'Total: R${order['total_price'].toStringAsFixed(2)}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => viewOrder(order['id']),
                              child: Text('Details',
                                  style: TextStyle(color: Colors.blue)),
                              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            ),
                            Text(order['status']),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(child: Text('No orders found.')),
    );
  }
}
