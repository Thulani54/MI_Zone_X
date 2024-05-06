import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.network(
                      'https://icons-for-free.com/iconfiles/png/512/check+checkbox+checkmark+confirm+success+yes+icon-1320196711226060446.png',
                      width: 60,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Confirmation',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You have successfully\ncompleted your order',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/my-orders'));
            },
            child: Text('Back to My Orders'),
          ),
        ),
      ),
    );
  }
}
