import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final String prodEnvironmentUrl =
    'https://insightsqa.dedicated.co.za:91/parlour-config';
String get parlourList => prodEnvironmentUrl + '/basic-fetch/?what=insurers';

class GetQuoteMoreDetailsPage extends StatefulWidget {
  @override
  _GetQuoteMoreDetailsPageState createState() =>
      _GetQuoteMoreDetailsPageState();
}

class _GetQuoteMoreDetailsPageState extends State<GetQuoteMoreDetailsPage> {
  String previousRoute = "";
  List<dynamic> possibleProducts = [];
  String dateOfBirth = "";

  @override
  void initState() {
    super.initState();
    getPreviousRoute();
    getQuoteInfo();
  }

  void getPreviousRoute() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      previousRoute = prefs.getString('previousRoute') ?? '/';
    });
  }

  void getQuoteInfo() async {
    final prefs = await SharedPreferences.getInstance();
    dateOfBirth = prefs.getString('dob') ?? '';
    final selectedParlour = prefs.getString('productQuoteName') ?? '';
    getProducts().then((parlourList) {
      // Assuming getProducts() fetches a list of parlours and their ids
      for (var i = 0; i < parlourList.length; i++) {
        if (parlourList[i].name == selectedParlour) {
          setState(() {
            possibleProducts = parlourList[i].products;
          });
        }
      }
    });
  }

  late final http.Client httpClient;
  Future<dynamic> getProducts() async {
    var response = await httpClient.get(Uri.parse(parlourList));
    return json.decode(response.body);
  }

  void buyProduct(int index) async {
    final product = possibleProducts[index];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('planType', product.productType);
    await prefs.setString('planBenefits', product.benefits.join(', '));
    await prefs.setString('productType', product.product);
    await prefs.setString('parlourType', product.clientName);
    await prefs.setDouble('premuimRate', product.rate);
    await prefs.setDouble('coverAmountRate', product.coverAmount);
    Navigator.pushNamed(context, '/buy-product');
  }

  void viewQuoteDetails(String parlourName) {
    Navigator.pushNamed(context, '/parlour-product-details',
        arguments: parlourName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, previousRoute),
        ),
      ),
      body: ListView.builder(
        itemCount: possibleProducts.length,
        itemBuilder: (context, index) {
          final prod = possibleProducts[index];
          return Column(
            children: [
              Divider(),
              ListTile(
                leading: Image.network(prod.imageUrl),
                title: Text('Parlour: ${prod.clientName}'),
                subtitle: Text('Plan Type: ${prod.productType}'),
                trailing: Text('Cover amount: R${prod.coverAmount}'),
                onTap: () => buyProduct(index),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('Page is being destroyed');
  }
}
