import 'dart:convert'; // For handling JSON data
import 'dart:io'; // For handling files

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddProductReviewPage extends StatefulWidget {
  final dynamic product; // Assuming product details are passed when navigating

  AddProductReviewPage({required Key key, this.product}) : super(key: key);

  @override
  _AddProductReviewPageState createState() => _AddProductReviewPageState();
}

class _AddProductReviewPageState extends State<AddProductReviewPage> {
  double rating = 0;
  TextEditingController commentController = TextEditingController();
  late File _imageFile;
  bool isSubmitted = false;

  void dismiss() {
    Navigator.pop(context);
  }

  void rate(double newRating) {
    setState(() {
      rating = newRating;
    });
  }

  Color getColor(double index) {
    if (index > rating) {
      return Colors.grey;
    } else if (rating <= 2) {
      return Colors.red;
    } else if (rating == 3) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  void onSubmit() {
    // Assuming you handle authentication and user info retrieval elsewhere in your app
    if (!isSubmitted) {
      // Process form submission here
      print('Rating: $rating, Comment: ${commentController.text}');
      // Implement your submission logic here, possibly including uploading the image
      dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: dismiss,
        ),
        title: Text('Write A Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (widget.product['image'] != null)
                Image.network(widget.product['image']),
              Text(widget.product['designation'] ?? 'No Title',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 20),
              Text('Choose a rating',
                  style: Theme.of(context).textTheme.subtitle1),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: rate,
              ),
              TextFormField(
                controller: commentController,
                decoration:
                    InputDecoration(labelText: 'Write a review here...'),
                maxLines: 5,
              ),
              ElevatedButton(
                onPressed: onSubmit,
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
