import 'package:flutter/material.dart';

class NominateLegendScreen extends StatefulWidget {
  @override
  _NominateLegendScreenState createState() => _NominateLegendScreenState();
}

class _NominateLegendScreenState extends State<NominateLegendScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _legendBioController = TextEditingController();
  final _provinceController = TextEditingController();
  final _municipalityController = TextEditingController();
  final _localCommunityController = TextEditingController();
  final _communityNameController = TextEditingController();
  final _communityDurationController = TextEditingController();
  final _legendLifeController = TextEditingController();
  final _legendImpactController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contactNumberController.dispose();
    _emailAddressController.dispose();
    _legendBioController.dispose();
    _provinceController.dispose();
    _municipalityController.dispose();
    _localCommunityController.dispose();
    _communityNameController.dispose();
    _communityDurationController.dispose();
    _legendLifeController.dispose();
    _legendImpactController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Form submitted');
      Navigator.pop(context); // Close the screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nominate Your Legend"),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a contact number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailAddressController,
                decoration: InputDecoration(labelText: 'Email Address'),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _legendBioController,
                decoration: InputDecoration(labelText: 'Legend Biography'),
                maxLines: 6,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a brief biography';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _communityNameController,
                decoration: InputDecoration(labelText: 'Community Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the community name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _communityDurationController,
                decoration: InputDecoration(labelText: 'Community Duration'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter how long they have been in the community';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _legendLifeController,
                decoration:
                    InputDecoration(labelText: 'What makes them a legend?'),
                maxLines: 6,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please describe what makes them a legend';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _legendImpactController,
                decoration: InputDecoration(labelText: 'Community Impact'),
                maxLines: 6,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please describe how they have impacted the community';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Province {
  final String name;
  final List<Community> communities;

  Province({required this.name, required this.communities});

  static List<Province> provinceList = [
    Province(
      name: "Eastern Cape",
      communities: [
        Community(
          name: "Amahlathi Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "Blue Crane Route Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
    Province(
      name: "Free State",
      communities: [
        Community(
          name: "Dihlabeng Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "Kopanong Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
    Province(
      name: "Gauteng",
      communities: [
        Community(
          name: "Emfuleni Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "Lesedi Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
    Province(
      name: "KwaZulu-Natal",
      communities: [
        Community(
          name: "Alfred Duma Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "Big 5 Hlabisa Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
    Province(
      name: "Limpopo",
      communities: [
        Community(
          name: "Ba-Phalaborwa Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "Bela-Bela Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
    Province(
      name: "Mpumalanga",
      communities: [
        Community(
          name: "Chief Albert Luthuli Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "Bushbuckridge Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
    Province(
      name: "North West",
      communities: [
        Community(
          name: "Tswaing Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "!Kheis Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
    Province(
      name: "Northern Cape",
      communities: [
        Community(
          name: "Dawid Kruiper Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "Umsobomvu Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
    Province(
      name: "Western Cape",
      communities: [
        Community(
          name: "Stellenbosch Local",
          cities: ["Cathcart", "Kei Road", "Keiskammahoek", "Stutterheim"],
        ),
        Community(
          name: "Witzenberg Local",
          cities: ["Cookhouse", "Pearston", "Petersburg", "Somerset East"],
        ),
      ],
    ),
  ];
}

class Community {
  final String name;
  final List<String> cities;

  Community({required this.name, required this.cities});
}
