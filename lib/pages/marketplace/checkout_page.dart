import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double subtotal = 200.0; // Example subtotal
  double tax = 15.0; // Example tax
  double shippingPrice = 20.0; // Example shipping price
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    setState(() {
      total = subtotal + tax + shippingPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Sub Total'),
                    trailing: Text('R${subtotal.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: Text('VAT'),
                    trailing: Text('R${tax.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: Text('Shipping'),
                    trailing: Text('R${shippingPrice.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: Text('Total'),
                    trailing: Text('R${total.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Promo Code',
                      suffixIcon: TextButton(
                        child: Text('Apply',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          // Implement promo code application
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Select payment method',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  ...List.generate(
                      4,
                      (index) => RadioListTile(
                            value: index,
                            groupValue: 1, // Change based on user selection
                            onChanged: (value) {
                              // Handle change
                            },
                            title: Text('Payment Option $index'),
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Implement submission logic
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Order Submitted'),
              content: Text('Your order has been submitted successfully.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
        label: Text('Submit Order'),
        icon: Icon(Icons.payment),
      ),
    );
  }
}
