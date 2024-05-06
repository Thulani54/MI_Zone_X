import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // For state management

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Category> categories =
      []; // Assuming Category is a model class you would define
  String filterText = '';
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Assuming you fetch categories from a service or locally
    categories =
        Provider.of<CategoryService>(context, listen: false).getCategories();
  }

  void dismiss() {
    Navigator.of(context).pop();
  }

  void applyFilter(String text) {
    setState(() {
      filterText = text.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Category> filteredCategories = categories
        .where((category) =>
            category.designation.toLowerCase().contains(filterText))
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: dismiss,
          color: Colors.white,
        ),
        title: Text('Write A Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: applyFilter,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCategories.length,
                itemBuilder: (context, index) {
                  final category = filteredCategories[index];
                  return ListTile(
                    title: Text(category.designation),
                    leading: Icon(Icons.category), // Assuming icons are generic
                    onTap: () => Navigator.pushNamed(
                        context, '/categoryDetails',
                        arguments: category),
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

class Category {
  String id;
  String designation;

  Category({required this.id, required this.designation});
}

class CategoryService {
  List<Category> getCategories() {
    // Simulate fetching categories
    return [
      Category(id: '1', designation: 'Books'),
      Category(id: '2', designation: 'Electronics'),
      // Add more categories
    ];
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<CategoryService>(create: (_) => CategoryService()),
      ],
      child: MaterialApp(
        home: CategoriesPage(),
        routes: {
          '/categoryDetails': (context) => CategoryDetailsPage(),
        },
      ),
    ),
  );
}

class CategoryDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.designation),
      ),
      body: Center(
        child: Text('Details for ${category.designation}'),
      ),
    );
  }
}
