import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetQuotePage extends StatefulWidget {
  @override
  _GetQuotePageState createState() => _GetQuotePageState();
}

class _GetQuotePageState extends State<GetQuotePage> {
  DateTime dateOfBirth = DateTime(2002, 1, 1);
  int coverAmount = 50000;
  int numberOfPeople = 1;
  int minValue = 0;
  int maxValue = 100000;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onSubmit() {
    // Here you would typically handle form submission to backend or other services
    if (_formKey.currentState!.validate()) {
      print(
          'Form submitted with values: $dateOfBirth, $coverAmount, $numberOfPeople');
      // Store or process the data
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Please tell us your date of birth"),
                          TextFormField(
                            initialValue:
                                DateFormat('yyyy-MM-dd').format(dateOfBirth),
                            onSaved: (value) =>
                                dateOfBirth = DateTime.tryParse(value!)!,
                            decoration:
                                InputDecoration(labelText: 'YYYY-MM-DD'),
                            keyboardType: TextInputType.datetime,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("How much cover do you want? R$coverAmount"),
                          Slider(
                            min: double.parse(minValue.toString()),
                            max: double.parse(maxValue.toString()),
                            value: double.parse(coverAmount.toString()),
                            divisions: 20,
                            label: coverAmount.toString(),
                            onChanged: (value) {
                              setState(() {
                                coverAmount = value.toInt();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "How many children do you want to cover? $numberOfPeople"),
                          Slider(
                            min: 0,
                            max: 10,
                            value: double.parse(numberOfPeople.toString()),
                            divisions: 10,
                            label: numberOfPeople.toString(),
                            onChanged: (value) {
                              setState(() {
                                numberOfPeople = value.toInt();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
