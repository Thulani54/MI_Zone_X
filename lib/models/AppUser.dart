class AppUser {
  final String? title;
  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;
  final String gender;
  final String idNumber;
  final String contactNumber;
  final String email;
  final String username;
  final String password;
  final bool? accountStatus;
  final DateTime timestamp;
  final DateTime lastUpdate;
  final String otp;
  final String emailUsername;
  final String profilePic;
  final String accountType;
  final DateTime dateTimestamp;
  final DateTime dateLastUpdate;
  final String? middleName;
  final String? relationship;
  final DateTime? dateOfDeath;
  final bool isHidden;

  AppUser({
    this.title,
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    required this.gender,
    required this.idNumber,
    required this.contactNumber,
    required this.email,
    required this.username,
    required this.password,
    this.accountStatus,
    required this.timestamp,
    required this.lastUpdate,
    required this.otp,
    required this.emailUsername,
    required this.profilePic,
    required this.accountType,
    required this.dateTimestamp,
    required this.dateLastUpdate,
    this.middleName,
    this.relationship,
    this.dateOfDeath,
    required this.isHidden,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        title: json['title'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        dateOfBirth: DateTime.parse(json['date_of_birth']),
        gender: json['gender'],
        idNumber: json['id_number'],
        contactNumber: json['contact_number'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        accountStatus: json['accountStatus'],
        timestamp: DateTime.parse(json['timestamp']),
        lastUpdate: DateTime.parse(json['lastUpdate']),
        otp: json['otp'],
        emailUsername: json['email_username'],
        profilePic: json['profilePic'],
        accountType: json['account_type'],
        dateTimestamp: DateTime.parse(json['date_timestamp']),
        dateLastUpdate: DateTime.parse(json['date_last_update']),
        middleName: json['middle_name'],
        relationship: json['relationship'],
        dateOfDeath: DateTime.parse(json['date_of_death']),
        isHidden: json['is_hidden'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'first_name': firstName,
        'last_name': lastName,
        'date_of_birth': dateOfBirth?.toIso8601String(),
        'gender': gender,
        'id_number': idNumber,
        'contact_number': contactNumber,
        'email': email,
        'username': username,
        'password': password,
        'accountStatus': accountStatus,
        'timestamp': timestamp.toIso8601String(),
        'lastUpdate': lastUpdate.toIso8601String(),
        'otp': otp,
        'email_username': emailUsername,
        'profilePic': profilePic,
        'account_type': accountType,
        'date_timestamp': dateTimestamp.toIso8601String(),
        'date_last_update': dateLastUpdate.toIso8601String(),
        'middle_name': middleName,
        'relationship': relationship,
        'date_of_death': dateOfDeath?.toIso8601String(),
        'is_hidden': isHidden,
      };
}
