import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewProductReviewPage extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;
  final Map<String, dynamic> productDetails;

  ViewProductReviewPage(
      {required Key key, required this.reviews, required this.productDetails})
      : super(key: key);

  @override
  _ViewProductReviewPageState createState() => _ViewProductReviewPageState();
}

class _ViewProductReviewPageState extends State<ViewProductReviewPage> {
  void addProductReview(Map<String, dynamic> product) {
    // Here you would call your method to add a product review.
    // For now, just print to console or update a state to simulate the interaction
    print("Add review for product: ${product['name']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Page"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Write a Review", style: TextStyle(fontSize: 24)),
                    SizedBox(height: 8),
                    Text(
                        "Happy with your product? Why not share your thoughts."),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => addProductReview(widget.productDetails),
                      child: Text("Write a Review"),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  var rev = widget.reviews[index];
                  return Column(
                    children: [
                      Text(DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(rev['createdAt']))),
                      Text(rev['name']),
                      Row(
                        children: List.generate(
                            5,
                            (starIndex) => Icon(
                                  Icons.star,
                                  color: starIndex < rev['rating']
                                      ? Colors.amber
                                      : Colors.grey,
                                )),
                      ),
                      Text(rev['comment'], overflow: TextOverflow.ellipsis),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
