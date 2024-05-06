import 'package:flutter/material.dart';

import '../services/corona_service.dart';

class Covid19Page extends StatefulWidget {
  @override
  _Covid19PageState createState() => _Covid19PageState();
}

class _Covid19PageState extends State<Covid19Page> {
  final CoronaService corona = CoronaService();

  String? country;
  int? confirmed;
  int? recovered;
  int? deaths;
  DateTime? date;
  int? active;
  double? percentageRecovered;
  double? percentageDeath;

  @override
  void initState() {
    super.initState();
    getSouthAfricaData();
  }

  void getSouthAfricaData() async {
    try {
      final data = await corona.getSouthAfricaLive();
      for (var x in data["Countries"]) {
        if (x["Country"] == "South Africa") {
          setState(() {
            country = x["Country"];
            confirmed = x["TotalConfirmed"];
            recovered = x["TotalRecovered"];
            deaths = x["TotalDeaths"];
            date = DateTime.parse(x["Date"]);
            active = confirmed! - recovered! - deaths!;

            percentageRecovered = (recovered! / confirmed!) * 100;
            percentageDeath = (deaths! / confirmed!) * 100;
          });
        }
      }
    } catch (e) {
      print("Failed to load data: $e");
    }
  }

  @override
  void dispose() {
    super.dispose();
    print('ngOnDestroy - Covid19 Page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Statistics for South Africa'),
      ),
      body: country == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Country: $country'),
                  Text('Confirmed: $confirmed'),
                  Text('Recovered: $recovered'),
                  Text('Deaths: $deaths'),
                  Text('Date: ${date!.toIso8601String()}'),
                  Text('Active: $active'),
                  Text(
                      'Recovery Rate: ${percentageRecovered!.toStringAsFixed(2)}%'),
                  Text('Death Rate: ${percentageDeath!.toStringAsFixed(2)}%'),
                ],
              ),
            ),
    );
  }
}
