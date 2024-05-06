import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String previous_route;
  final double xvalue;
  final String product_name;
  final String planType;
  final String parlour_name;

  MyWidget({
    required this.previous_route,
    required this.xvalue,
    required this.product_name,
    required this.planType,
    required this.parlour_name,
  });

  final TextEditingController firstnamesController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNumController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController dpipDeclarationController =
      TextEditingController();
  final TextEditingController fppoDeclarationController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int step = 1;
  bool showDPIP = false;
  bool showFPPO = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Process is ${xvalue != null ? (xvalue * 100).toStringAsFixed(0) : ''}% complete',
                  style: TextStyle(fontSize: 16),
                ),
                LinearProgressIndicator(value: xvalue),
                Text(
                  '$product_name - $planType',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 16),
                if (step == 1) ...[
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: firstnamesController,
                          decoration: InputDecoration(
                            labelText: 'Name(s)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter First Name.';
                            }
                            if (value.length < 3) {
                              return 'First Name required at least 3 characters.';
                            }
                            if (value.length > 30) {
                              return 'First Name required only 30 characters.';
                            }
                            if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                              return 'Only characters are allowed.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: surnameController,
                          decoration: InputDecoration(
                            labelText: 'Surname',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Surname.';
                            }
                            if (value.length > 30) {
                              return 'Surname required only 30 characters.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email.';
                            }
                            if (value.length < 5) {
                              return 'The email required at least 5 characters.';
                            }
                            if (value.length > 80) {
                              return 'The email required only 80 characters.';
                            }
                            if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]+$')
                                .hasMatch(value)) {
                              return 'The Email is not valid.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: contactNumController,
                          decoration: InputDecoration(
                            labelText: 'Mobile Phone Number',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Phone Number.';
                            }
                            if (value.length != 10) {
                              return 'Phone Number required only 10 characters.';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Only Numbers are allowed.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'By submitting your details you consent to $parlour_name processing and retaining your personal information in line with their Privacy Policy which is available on:',
                  ),
                ],
                if (step == 2) ...[
                  Text('Now, tell us who you are?'),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select a title';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: firstnamesController,
                          decoration: InputDecoration(
                            labelText: 'Name(s)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter First Name.';
                            }
                            if (value.length < 3) {
                              return 'First Name required at least 3 characters.';
                            }
                            if (value.length > 30) {
                              return 'First Name required only 30 characters.';
                            }
                            if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                              return 'Only characters are allowed.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: surnameController,
                          decoration: InputDecoration(
                            labelText: 'Surname',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Surname.';
                            }
                            if (value.length > 30) {
                              return 'Surname required only 30 characters.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: idNumberController,
                          decoration: InputDecoration(
                            labelText: 'RSA ID Number',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter ID number.';
                            }
                            if (value.length != 13) {
                              return 'ID number must be 13 characters.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email.';
                            }
                            if (value.length < 5) {
                              return 'The email required at least 5 characters.';
                            }
                            if (value.length > 80) {
                              return 'The email required only 80 characters.';
                            }
                            if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]+$')
                                .hasMatch(value)) {
                              return 'The Email is not valid.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: contactNumController,
                          decoration: InputDecoration(
                            labelText: 'Mobile Phone Number',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Phone Number.';
                            }
                            if (value.length != 10) {
                              return 'Phone Number required only 10 characters.';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Only Numbers are allowed.';
                            }
                            return null;
                          },
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
                              'FICA DECLARATION',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'In the past year, have you, or anyone on this policy held any public position including acting as any government official or politically related position? *DPIP',
                              style: TextStyle(fontSize: 14),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 'Yes',
                                  groupValue: dpipDeclarationController.text,
                                  onChanged: (value) {
                                    dpipDeclarationController.text =
                                        value.toString();
                                  },
                                ),
                                Text('Yes'),
                                Radio(
                                  value: 'No',
                                  groupValue: dpipDeclarationController.text,
                                  onChanged: (value) {
                                    dpipDeclarationController.text =
                                        value.toString();
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                            if (showDPIP) ...[
                              Text(
                                'DPIP explained.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                'A DPIP (domestic prominent influential person) is an individual who holds, including in an acting position for a period exceeding six months, or has help at any time in the preceding 12 months in South Africa a prominent public function including the following:',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- The President or Deputy President.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- A Government Minister or Deputy inister.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- The Premier of a Province.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- A Member of the Executive Council of a Province.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- The Head, Accounting Officer or Chief Financial Officer of a National or Provisional Department or Government Component.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- The Chairperson of a Controlling Body, the Chief Executive Officer, or a natural person who is the Accounting Authority, the Chief Financial Officer or the Chief Invetment Officer of a Public Entity isted in Schedule 2 or 3 to the Public Finance Management Acts.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- An Executive Mayor of a Municipality.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- The Municipal Manager of a Municipality.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- The Chief Financial Offficer of a Municipality.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- The Chairperson of the Controlling Body, Chief Executive Officer, Chief Financial Officer or Chief Investment Officer of a Municipal Entity as defined in Section 1 of the Local Government: Municiapl Systems Act',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- A Constitutional Court Judge ir any other Judge.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- A Leader of a Political Party.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- A Memeber of a Royal Family or Senior Traditional Leader.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- An ambassador or high comissioner or other senior representative of a foreign government based in the Republic of South Africa.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- An officer of the South African National Defense Force above the rank of major-general.',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '- The position of head, or other executive directly accoutable to that head, of an international organisation based in the Republic of South Africa.',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   showDPIP = !showDPIP;
                                // });
                              },
                              child: Text(
                                showDPIP ? 'Hide DPIP' : 'Show DPIP',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In the past 12 months, have you, or anyone on this policy held a position in a prominent public function in a foreign country? *FPPO',
                              style: TextStyle(fontSize: 14),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 'Yes',
                                  groupValue: fppoDeclarationController.text,
                                  onChanged: (value) {
                                    fppoDeclarationController.text =
                                        value.toString();
                                  },
                                ),
                                Text('Yes'),
                                Radio(
                                  value: 'No',
                                  groupValue: fppoDeclarationController.text,
                                  onChanged: (value) {
                                    fppoDeclarationController.text =
                                        value.toString();
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submit();
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    // Submit form data
  }
}
