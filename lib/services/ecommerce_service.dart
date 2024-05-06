import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EcommerceService {
  final String primaryVariable = 'https://qa.miinsightsapps.net/strawberry/';
  final String environmentUrl2 =
      'https://qa.miinsightsapps.net/strawberry/ecommerce/';

  final StreamController<void> invokeFirstComponentFunction =
      StreamController<void>.broadcast();

  void displayReviewFunctionFromAddNewReviewModal() {
    invokeFirstComponentFunction.add(null);
  }

  void displayShippingAddressFunctionFromChangeShippingAddress() {
    invokeFirstComponentFunction.add(null);
  }

  Future<dynamic> getEcomProducts() async {
    var response = await http.get(Uri.parse(environmentUrl2 + 'getProducts/'));
    return jsonDecode(response.body);
  }

  Future<dynamic> getEcomReviews() async {
    var response =
        await http.get(Uri.parse(environmentUrl2 + 'getproductreview/'));
    return jsonDecode(response.body);
  }

  Future<dynamic> getEcomCategories() async {
    var response = await http.get(Uri.parse(environmentUrl2 + 'getCategory/'));
    return jsonDecode(response.body);
  }

  Future<dynamic> getEcomProductImages() async {
    var response =
        await http.get(Uri.parse(environmentUrl2 + 'productImages/'));
    return jsonDecode(response.body);
  }

  Future<dynamic> getEcomShippingAddress() async {
    var response =
        await http.get(Uri.parse(environmentUrl2 + 'getShippingAddress/'));
    return jsonDecode(response.body);
  }

  Future<dynamic> getEcomShippingRate() async {
    var response =
        await http.get(Uri.parse(environmentUrl2 + 'getShippingRate/'));
    return jsonDecode(response.body);
  }

  Future<dynamic> getEcomOrders() async {
    var response = await http.get(Uri.parse(environmentUrl2 + 'viewOrder/'));
    return jsonDecode(response.body);
  }

  Future<dynamic> getEcomOrderItems() async {
    var response =
        await http.get(Uri.parse(environmentUrl2 + 'viewOrderItems/'));
    return jsonDecode(response.body);
  }

  Future<dynamic> createEcomOrder(Map<String, dynamic> orderDetails) async {
    var response = await http.post(Uri.parse(environmentUrl2 + 'createOrder/'),
        body: jsonEncode(orderDetails),
        headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }

  Future<dynamic> addEcomProductReview(
      Map<String, dynamic> reviewDetails) async {
    var response = await http.post(
        Uri.parse(environmentUrl2 + 'addproductreview/'),
        body: jsonEncode(reviewDetails),
        headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }
}
