import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TermsAndConditionsPage(),
  ));
}

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
        ),
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to MI-ZONE>X, the web and mobile application services of MI-ZONE>X Pte Ltd (“Company,” “we,” or “us”), a company incorporated under the laws of the Republic of Singapore. This page explains the terms by which you may use our online and/or mobile services, web site, and software provided on or in connection with the service (collectively the “Service”). By accessing or using the Service, you agree that you have read, understood, and agree to be bound by this Terms of Use Agreement (“Agreement”) and consent to the our collection, use, and disclosure of your information for the purposes of providing the Service to you, whether or not you are a registered user of our Service. This Agreement applies to all visitors, users, and others who access or use the Service (“Users”).\n\n'
              'PLEASE READ THIS AGREEMENT CAREFULLY TO ENSURE THAT YOU UNDERSTAND EACH PROVISION. THIS AGREEMENT CONTAINS A MANDATORY ARBITRATION OF DISPUTES PROVISION THAT REQUIRES THE USE OF ARBITRATION ON AN INDIVIDUAL BASIS TO RESOLVE DISPUTES, RATHER THAN JURY TRIALS, CLASS ACTIONS, OR OTHER PROCEEDINGS.\n\n',
              textAlign: TextAlign.justify,
            ),
            // Add more Text widgets for each paragraph or section of your terms
            Text(
              '1. Use of the Service\n\n'
              'A. Eligibility\n'
              'You may use the Service only if (i) you have the legal capacity to enter into a binding contract with Company, (ii) you abide by the provisions in this Agreement and all applicable local, state, national, and international laws, rules and regulations. The Service is not available to any Users previously removed from the Service by us.\n\n',
              textAlign: TextAlign.justify,
            ),
            // Continue adding Text widgets for other sections
          ],
        ),
      ),
    );
  }
}
