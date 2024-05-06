import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ViewIncomePage extends StatefulWidget {
  @override
  _ViewIncomePageState createState() => _ViewIncomePageState();
}

class _ViewIncomePageState extends State<ViewIncomePage> {
  final List<Map<String, dynamic>> slidesItems = [
    {
      'id': 995,
      'image': 'https://via.placeholder.com/300x200',
      'title': 'Title 1',
      'desc': 'Description here for Title 1'
    },
    {
      'id': 926,
      'image': 'https://via.placeholder.com/300x200',
      'title': 'Title 2',
      'desc': 'Description here for Title 2'
    },
    {
      'id': 940,
      'image': 'https://via.placeholder.com/300x200',
      'title': 'Title 3',
      'desc': 'Description here for Title 3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Funeral Programs'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image.network(slidesItems[index]['image']),
                    Text(slidesItems[index]['title'],
                        style: TextStyle(fontSize: 24)),
                    Text(slidesItems[index]['desc']),
                  ],
                );
              },
              itemCount: slidesItems.length,
              pagination: SwiperPagination(),
              control: SwiperControl(),
              autoplay: true,
            ),
            SizedBox(height: 40),
            // Additional swiper instances can be added here with different configurations
          ],
        ),
      ),
    );
  }
}
