import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // Ensure you have a service class for data fetching
import 'package:mi_zone/services/ccl_service.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late List<dynamic> category;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      var fetchedCategories = await getProductCategory();
      setState(() {
        category = fetchedCategories['message'];
      });
    } catch (e) {
      setState(() {
        error =
            'An error occurred, the data could not be retrieved: ${e.toString()}';
      });
    }
  }

  Future<dynamic> getProductCategory() async {
    final http.Client httpClient = http.Client();
    final response =
        await httpClient.get(Uri.parse(apiUrl + 'get-product-categories/'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Categories'),
        ),
        body: Column(children: [
          category != null ? buildCategoryGrid() : buildSkeleton(),
          Container(
            padding: EdgeInsets.all(8),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/view-income');
              },
              child: Text('Click to View Income Inequality by Group'),
            ),
          ),
        ]));
  }

  Widget buildCategoryGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: category.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => navigateTo(category[index]['path']),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.category), // Placeholder for actual icons
                Text(category[index]['category']),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSkeleton() {
    return Center(
      child: error.isEmpty
          ? CircularProgressIndicator()
          : Text(error, style: TextStyle(color: Colors.red)),
    );
  }

  void navigateTo(String path) {
    Navigator.of(context).pushNamed(path);
  }
}
