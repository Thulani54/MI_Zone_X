import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';
import 'package:mi_zone/screens/resetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../Constants/constants.dart';
import '../customwidgets/custom_input.dart';
import '../services/longPrint.dart';
import '../services/secureScreen.dart';
import '../services/sharedPrefs.dart';
import 'MyHomePage.dart';

FocusNode email_focusNode = FocusNode();
FocusNode password_focusNode = FocusNode();
TextEditingController email_controller = TextEditingController();
TextEditingController password_controller = TextEditingController();
late VideoPlayerController _controller;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _acceptTerms = false;

  void _toggleAcceptTerms(bool? value) {
    setState(() {
      _acceptTerms = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            /* _controller.value.isInitialized
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: VideoPlayer(_controller),
                  )
                : Container(),*/
            /* Container(
              width: MediaQuery.of(context).size.width * 5,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "lib/assets/backGround.jpg",
                fit: BoxFit.contain,
              ),
            ),*/
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        "lib/assets/logo_main.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Placeholder(),
                  /*if (Constants.currentBusinessInfo.logo.isNotEmpty)
                    Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: CachedNetworkImage(
                          imageUrl: Constants.currentBusinessInfo.logo,
                          fit: BoxFit.fitHeight,
                          */ /*   placeholder: (context, url) => Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator()),*/ /*
                          // errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),*/
                  // Container(width: 200, height: 200, child: Placeholder()),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "DRIVE BUSINESS GROWTH",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Through Real-time Tracking of KPI's",
                    style: GoogleFonts.lato(
                      color: Constants.ctaColorLight,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                  ),
                  Container(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomInput(
                              controller: email_controller,
                              hintText: "Email",
                              onChanged: (val) {},
                              onSubmitted: (val) {},
                              focusNode: email_focusNode,
                              textInputAction: TextInputAction.next,
                              isPasswordField: false),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomInput(
                              controller: password_controller,
                              hintText: "Password",
                              onChanged: (val) {},
                              onSubmitted: (val) {},
                              focusNode: password_focusNode,
                              textInputAction: TextInputAction.next,
                              isPasswordField: true),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (email_controller.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please enter your email",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (password_controller.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please enter your password",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              //sign_in(context, "Master@everestmpu.com", "123456");
                              sign_in(context, email_controller.text.trim(),
                                  password_controller.text.trim());
                            }
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Constants.ctaColorLight,
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                      color: Constants.ctaColorLight)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8, top: 12, bottom: 12),
                                child: Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      letterSpacing: 1.05,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "TradeGothic",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => resetPassword(),
                              ),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, left: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(360),
                                  border: Border.all(
                                      color: Constants.ctaColorLight)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8, top: 12, bottom: 12),
                                child: Center(
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      letterSpacing: 1.05,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "TradeGothic",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 48,
                  ),
                  if (Constants.isLoggedIn == true)
                    InkWell(
                      onTap: () async {
                        final LocalAuthentication auth = LocalAuthentication();
                        final bool canAuthenticateWithBiometrics =
                            await auth.canCheckBiometrics;
                        final bool canAuthenticate =
                            canAuthenticateWithBiometrics ||
                                await auth.isDeviceSupported();
                        bool authenticated = false;
                        if (kDebugMode) {
                          print('InkWell tapped');
                        }
                        print(
                            'Can check biometrics: $canAuthenticateWithBiometrics');
                        print('Can authenticate: $canAuthenticate');

                        try {
                          authenticated = await auth.authenticate(
                            localizedReason:
                                'Scan your fingerprint to authenticate',
                          );
                        } catch (e) {
                          print(e);
                        }
                        if (authenticated) {
                          print("fghhg");
                          String email1 = "";
                          String password1 = "";
                          Sharedprefs.getUserEmailSharedPreference2()
                              .then((value) {
                            print("email1 ${email1}");
                            if (value != null) email1 = value.toString();
                          });
                          Sharedprefs.getUserPasswordPreference().then((value) {
                            if (value != null) password1 = value;
                            print("password1 ${password1}");
                          });

                          Future.delayed(Duration(seconds: 1)).then((value) {
                            if (email1.isEmpty || password1.isEmpty) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Please sign in with your email and password",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              sign_in(context, email1, password1);
                            }
                          });
                        }
                      },
                      child: SvgPicture.asset(
                        "lib/assets/fingerprint.svg",
                        color: Constants.ctaColorLight,
                      ),
                    ),

                  SizedBox(
                    height: 16,
                  ),
                  /*            Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(360),
                                    side: BorderSide(
                                        color: Constants.ctaColorLight,
                                        width: 1,
                                        style: BorderStyle.solid))),
                            onPressed: () {
                              if (email_controller.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter your email",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (password_controller.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter your password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                */ /*sign_in(context, "mncedisi@athandwe.co.za",
                                    "nosama@2023");*/ /*
                                //sign_in(context, email_controller.text, password_controller.text);
                              }
                            },
                            child: Container(
                              height: 35.0,
                              width: 100.0,
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.inter(
                                    color: Constants.ctaColorLight,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sign_in(BuildContext context, String email, String password) {
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => LoadingDialog(),
    );
    String baseUrl = Constants.insightsbaseUrl + "Admin/Login";
    Map payload = {
      "device_id":
          "dC7JwXFwwdI:APA91bF0gTbuXlfT6wIcGMLY57Xo7VxUMrMH-MuFYL5PnjUVI0G5X1d3d90FNRb8-XmcjI40L1XqDH-KAc1KWnPpxNg8Z8SK4Ty0xonbz4L3sbKz3Rlr4hyBqePWx9ZfEp53vWwkZ3tx",
      "password": password,
      "userEmail": email
    };
    try {
      http.post(Uri.parse(baseUrl), body: payload).then((value) async {
        http.Response response = value;
        if (kDebugMode) {
          print(response);
          print(response.statusCode);
          print("hjjnmnjlkj" + response.body);
        }
        if (response.statusCode != 200) {
          Navigator.of(context).pop();
          Fluttertoast.showToast(
              msg: "Could not sign in",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Map responsedata = jsonDecode(response.body);

          List<dynamic>? usersList = responsedata["userExists"];
          if (usersList == null) {
            if (responsedata["ErrorMessagePassword"] != null) {
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                  msg: responsedata["ErrorMessagePassword"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (responsedata["ErrorMessageNullCredentials"] != null) {
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                  msg: responsedata["ErrorMessageNullCredentials"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          } else if (usersList.isNotEmpty) {
            Constants.screenWidth = MediaQuery.of(context).size.width;
            Constants.screenHeight = MediaQuery.of(context).size.height;
            email_controller.text = "";
            password_controller.text = "";
            logLongString(usersList![0].toString());
            Constants.myDisplayname = usersList[0]["employee_name"];
            Constants.myEmail = usersList[0]["employee_email"];
            Constants.myCell = usersList[0]["client_phone"] ?? "";

            Sharedprefs.saveUserLoggedInSharedPreference(true);
            Sharedprefs.saveUserNameSharedPreference(
                usersList[0]["employee_name"]);
            if (kDebugMode) {
              print("gfhgy $email");
            }
            Sharedprefs.saveUserEmailSharedPreference(email);
            Sharedprefs.saveUserEmailSharedPreference2(email);

            Sharedprefs.saveUserEmpIdSharedPreference(
                usersList[0]["cec_employeeid"]);
            Sharedprefs.saveUserPasswordPreference(password);

            Sharedprefs.saveUserCecClientIdSharedPreference(
                usersList[0]["cec_client_id"]);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('require_password', false);
            if (email.toLowerCase() != "Master@Everestmpu.com".toLowerCase()) {
            } else if (email.toLowerCase() !=
                "Thulani@insights.co.za".toLowerCase()) {
            } else if (email.toLowerCase() !=
                "Lindiwe@everestmpu.co.za".toLowerCase()) {
            } else if (email.toLowerCase() !=
                "Ruthn@everestmpu.co.za".toLowerCase()) {
            } else {
              /*  await FlutterWindowManager.addFlags(
                  FlutterWindowManager.FLAG_SECURE);*/
              if (Platform.isAndroid) {
                await FlutterWindowManager.addFlags(
                    FlutterWindowManager.FLAG_SECURE);
              }
            }
            Future.delayed(Duration(seconds: 3), () async {
              Navigator.of(context).pop();
              if (kDebugMode) {
                print("ffgfggfhhgg ${Constants.account_type}");
              }
              if (Constants.account_type == "admin") {
                /*     Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SalesAgentHomePage()));*/
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }
              checkTermsAccepted(usersList[0]["cec_employeeid"],
                  usersList[0]["cec_client_id"]);
              acceptTerms(usersList[0]["cec_employeeid"],
                  usersList[0]["cec_client_id"], 1, true);
              Fluttertoast.showToast(
                  msg: "Welcome " + usersList[0]["employee_name"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              EncryptedSharedPreferences.saveLastLoginDateTime(DateTime.now());
              EncryptedSharedPreferences.saveEncryptedString(
                  "employee_name", usersList[0]["employee_name"]);
              EncryptedSharedPreferences.saveEncryptedString(
                  "employee_email", usersList[0]["employee_email"]);
              /*  EncryptedSharedPreferences.saveEncryptedString(
                  "client_phone", usersList[0]["client_phone"]??"");*/
              EncryptedSharedPreferences.saveEncryptedInt(
                  "cec_client_id", usersList[0]["cec_client_id"]);
              EncryptedSharedPreferences.saveEncryptedInt(
                  "cec_employeeid", usersList[0]["cec_employeeid"]);
            });
          } else {
            Fluttertoast.showToast(
                msg: "Please verify your email and password",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      });
    } catch (error) {
      if (error is SocketException) {
        handleNetworkError(context);
      } else {
        // Handle other types of errors
        handleOtherErrors(context, error);
      }
      // Assuming EncryptedSharedPreferences.getLastLoginDateTime() is an async operation.

      // It's usually a good practice to log the exception
      if (kDebugMode) {
        print("Exception caught: $error");
      }
    }
  }

  void handleNetworkError(BuildContext context) {
    EncryptedSharedPreferences.getLastLoginDateTime().then((lastLoginDate) {
      if (lastLoginDate != null) {
        final now = DateTime.now();
        final difference = now.difference(lastLoginDate).inHours;

        if (difference < 24) {
          // Less than 24 hours since last login, proceed to the homepage.
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyHomePage()),
            (Route<dynamic> route) => false,
          );
        } else {
          // More than 24 hours or exact 24 hours since last login, show toast.
          Fluttertoast.showToast(
              msg: "Network error. Please check your connection and try again.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        // Last login date is not available, show network error toast.
        Fluttertoast.showToast(
            msg: "Network error. Please check your connection and try again.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }).catchError((error) {
      showNetworkErrorToast(context);
    });
  }

  void showNetworkErrorToast(BuildContext context) {
    Fluttertoast.showToast(
        msg:
            "Network error. Please check your internet connection and try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

// Function to handle other errors
  void handleOtherErrors(BuildContext context, dynamic error) {
    // Your existing error handling logic
    Navigator.of(context).pop();
    Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    secureScreen();
    Sharedprefs.getUserLoggedInSharedPreference().then((value) {
      if (value != null) Constants.isLoggedIn = value;
      print("valuerdg0 $value");
    });

    /* _controller = VideoPlayerController.asset('lib/assets/vid_2.mp4')
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });*/
    Future.delayed(Duration(seconds: 2)).then((value) async {
      setState(() {});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Constants.accepted_terms = prefs.getBool(
            'accepted_terms',
          ) ??
          false;
      print("ggfghgh ${Constants.accepted_terms}");
      if (Constants.accepted_terms == false) {
        // showPermisionsDialog();
      }
    });
  }

  Future<void> acceptTerms(
      int empId, int cecClientId, int termsId, bool accepted) async {
    String acceptTermsUrl = "${Constants.insightsbaseUrl}files/accept_terms/";
    Map<String, dynamic> payload = {
      'emp_id': empId,
      'cec_client_id': cecClientId,
      'terms_id': termsId,
      'accepted': accepted,
    };

    try {
      http.Response response = await http.post(Uri.parse(acceptTermsUrl),
          body: json.encode(payload),
          headers: {'Content-Type': 'application/json'});
      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        print("Terms acceptance recorded successfully.");
      } else {
        print("Error: Unable to record terms acceptance.");
      }
    } catch (e) {
      print("Exception caught: $e");
    }
  }

  Future<void> checkTermsAccepted(int empId, int cecClientId) async {
    String url = "${Constants.insightsbaseUrl}files/check_terms_acceptance/";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        bool accepted = data['accepted'];
        if (data['accepted'] == true) {
          Constants.accepted_terms = true;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('accepted_terms', true);
        } else if (data['accepted'] == false) {
          Constants.accepted_terms = false;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('accepted_terms', false);
        }
        print("Terms accepted: $accepted");
      } else {
        print("Error: Unable to check terms acceptance.");
      }
    } catch (e) {
      print("Exception caught: $e");
    }
  }

  Future<void> showPermisionsDialog() async {
    final prefs = await SharedPreferences.getInstance();
    int obtainedCount = prefs.getInt('usageCount') ?? 0;
    print("obtainedCount ${obtainedCount}");
    if (obtainedCount < 5) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TermsAndConditions(
            onProceed: () {},
          ),
        ),
      );
    }
  }
}

class TermsAndConditions extends StatefulWidget {
  final VoidCallback onProceed;

  TermsAndConditions({required this.onProceed});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isExpanded = false;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 65),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16),
              child: Center(
                child: Text(
                  "MI FinTech Solutions (Pty) Ltd Mobile Application",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16),
              child: Center(
                child: Text(
                  "MI Insights Terms of Use and Privacy Policy",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 22,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6)),
                    margin: EdgeInsets.only(left: 24, right: 24, top: 16),
                  ),
                  Center(
                    child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Color(0xffED7D32),
                          borderRadius: BorderRadius.circular(6)),
                      margin: EdgeInsets.only(left: 32, right: 32, top: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'I agree to the Terms and Conditions',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: InkWell(
                      onTap: () async {
                        // if (_isChecked == true) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('accepted_terms', true);
                        Navigator.of(context).pop();
                        widget.onProceed();
                        /*   } else {
                          MotionToast.error(
                            onClose: () {},
                            description:
                                Text("Please accept terms to continue"),
                          ).show(context);
                        }*/
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Constants.ctaColorLight,
                            borderRadius: BorderRadius.circular(360),
                            border: Border.all(color: Constants.ctaColorLight)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 12, bottom: 12),
                          child: Center(
                            child: Text(
                              "I agree",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 1.05,
                                fontWeight: FontWeight.w600,
                                fontFamily: "TradeGothic",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            isExpanded == false
                ? Expanded(child: Container())
                : Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                'Welcome to the MI FinTech Solutions (Pty) Ltd Mobile Application named "MI Insights" ("App"). By accessing or using MI Insights, you agree to comply with and be bound by the following Terms of Use and Privacy Policy. If you do not agree with these terms, please do not use MI Insights.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: isExpanded == false ? 5 : 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "Terms of Use",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15.5,
                                    decoration: TextDecoration.none,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "1.1 These Terms constitute a binding agreement between you and MI FinTech Solutions, governing your use of the Application and its associated Software.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '1.2 MI FinTech Solutions grants you a license to use the Application, subject to these Terms and any Appstore Rules from where you downloaded it.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '1.3 The Application is not sold to you; MI FinTech Solutions retains ownership at all times.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '1.3 The Application is not sold to you; MI FinTech Solutions retains ownership at all times.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '1.4 Compatibility requires a smartphone or tablet with internet access and compatible operating systems like iOS or Android.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "1.5 If the Device isn't yours, you confirm permission from the owner for Application installation.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            //
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "2 DEFINITIONS AND INTERPRETATION",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.1 "Application" refers to MI Insights, the MI FinTech Solutions Mobile App, including Applets, for communication and media exchange with compatible devices using the Software.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.2 "Applet/s" are unique modules and or services within the MI FinTech Solutions Mobile App, accessible through MI Insights, such as Underwriting Module, Sales Module, Claims Module and Retentions Module.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.3 "MI FinTech Solutions" or "we"; refers to MI FinTech Solutions Proprietary Limited, a licensed Financial Services Provider.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.4 "Software" is the software and media enabling Application use.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.5 "User" or "you"; refers to anyone installing the Software or using the Application.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.6 Singular references include the plural, and vice versa.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.7 Links to other documents are integral to these Terms under the ECT Act.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.8 Unspecified terms follow ECT Act definitions.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.9 The ECT Act can be viewed at https://www.gov.za/sites/default/files/gcis_document/201409/a25-02.pdf; ensure you have the latest version.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '2.10 Clause headings are for convenience and not for interpreting the terms and conditions.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            //
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "3 ACCEPTANCE OF TERMS",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "3.1 To register for the Application, you will be requested to accept the terms and conditions and your response in the affirmative confirms the user on MI FinTech Solutions' database.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            //
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "4 INFORMATION PROVIDED ON THE APPLICATION",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '4.1 Unlike MI Insights, the core application, users have free access to the Mobile Application for reporting purposes. The application offers information on the users’ business and aims the assist executives and management to have a close management of their business by providing them with insights relating to their key performance indicators such as movement or growth in sales, collection of premium, claims submitted, etc.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            //

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '4.2 Some information serves as a summary, and Users are advised to visit the core applications, MI Insights, for comprehensive details.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "Intellectual Property. The Platform and its entire contents, features, and functionality (including but not limited to all information, software, text, displays, images, video, and audio, and the design, selection, and arrangement thereof), are owned by MI Insights, its licensors, or other providers of such material and are protected by South African and international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "5 GRANT OF LICENSE AND USE OF THE APPLICATION",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "5.1 MI FinTech Solutions grants users a non-transferable, non-exclusive license for personal use, subject to these Terms and Appstore Rules.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "5.2 Users may not use the Application for commercial purposes without written consent.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "6 INTELLECTUAL PROPERTY RIGHTS",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '6.1 All intellectual property rights for the Application and associated content belong to MI FinTech Solutions.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            //

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '6.2 Users have no rights to access the Application in source code form.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "7 AMENDMENTS AND CHANGES TO PROFILE",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '7.1 MI FinTech Solutions may amend Terms, and users must accept them for continued use.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '7.2 MI FinTech Solutions reserves the right to change or discontinue aspects of the Application.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "8 PRIVACY POLICY AND DATA PROTECTION",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '8.1 MI FinTech Solutions commits to protecting user data in line with applicable data protection legislation.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '8.2 Users agree to the collection, processing, and storage of personal information for Application access and other specified purposes.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "9 DATA CONSUMPTION",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '9.1 The Application uses data for communication, and users are responsible for associated costs.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '9.2 Users must be aware of potential higher data pricing when roaming.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "10 DISCLAIMERS AND LIMITATION OF LIABILITY",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '10.1 Information provided by the Application comes without warranties, and users use it at their own risk.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '10.2 MI FinTech Solutions is not liable for any damages arising from various factors, including Application unavailability and third-party actions.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '10.3 MI FinTech Solutions strives for content accuracy but does not guarantee it. Users acknowledge the responsibility for their decisions based on the information.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "11 ELIMINATION OF ERRORS",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '11.1 Users are encouraged to report any harmful, untrue, illegal, infringing, defamatory or inaccurate content to MI FinTech Solutions for correction or removal.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "12 DISPUTE RESOLUTION",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '12.1 Disputes are to be resolved in good faith. Unresolved issues may be referred to arbitration with Arbitration Foundation of Southern Africa (&quot;AFSA&quot;).',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '12.2 Interim relief may be sought from a South African court pending arbitration.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "13 OTHER IMPORTANT TERMS",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '13.1 These Terms prevail over any User communications or postings and constitute the entire agreement between MI FinTech Solutions and the User.',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "13.2 MI FinTech Solutions' failure to enforce User obligations or rights does not waive those rights, except in writing. Delayed enforcement doesn't imply a waiver.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "13.3 MI FinTech Solutions can transfer rights and obligations to another organization withoutaffecting User rights or MI FinTech Solutions' obligations.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "13.4 If any Terms detailed herein are found unenforceable or invalid for any reason, such term(s) or condition(s) shall be severable from the remaining Terms. The remaining Terms shall remain enforceable and applicable.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "13.5 No provision limits MI FinTech Solutions' liability beyond what the law allows. User's assumed risk or liability is limited as allowed by law. The Consumer Protection Act, 2008 (Consumer Protection Act&quot;) rights are not limited or excluded.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "13.5 No provision limits MI FinTech Solutions' liability beyond what the law allows. User's assumed risk or liability is limited as allowed by law. The Consumer Protection Act, 2008 (Consumer Protection Act&quot;) rights are not limited or excluded.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "13.5 No provision limits MI FinTech Solutions' liability beyond what the law allows. User's assumed risk or liability is limited as allowed by law. The Consumer Protection Act, 2008 (Consumer Protection Act&quot;) rights are not limited or excluded.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "13.6 If subject to the Consumer Protection Act, all Terms are qualified to comply with the Act.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                " 13.7 The Application, governed by South African law, is subject to South African courts, regardless of the User's country of residence.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                '14 VARIATION OF CERTAIN DEEMING PROVISIONS IN THE ECT ACT',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "14.1 Users agree that these Terms create a binding contract with MI FinTech Solutions, even if wholly or partially in a data message. Users specifically agree:",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "14.1.1 These Terms are treated as concluded at MI FinTech Solutions' physical address upon the User's first access, registration, or use of the Application.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "14.1.2 No electronic signature is required for User or MI FinTech Solutions to agree to these Terms.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "14.1.3 User's use of the Application serves as sufficient evidence of agreement to these Terms.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "14.1.4 Any data message is deemed sent from MI FinTech Solutions' physical address if the User's usual place of business or residence is not in South Africa.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "14.1.5 Unless otherwise specified, communications sent by an automated information system on MI FinTech Solutions'' behalf are deemed data messages authorized by MI FinTech Solutions.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16, top: 16, right: 16),
                              child: Text(
                                "14.1.6 User-sent data messages are acknowledged upon MI FinTech Solutions' acknowledgment or by a person authorized to act on its behalf.",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13.5,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 16,
                            ),
                            Container(
                                height: 4,
                                color: Colors.grey.withOpacity(0.35),
                                width: MediaQuery.of(context).size.width),
                            SizedBox(height: 12),
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                child: Center(
                                    child: Text.rich(TextSpan(
                                        text:
                                            'MI FinTech Solutions is a licensed Financial Services Provider (“FSP”), view our',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: 'Disclaimer,',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // code to open / launch terms of service link here
                                            }),
                                      TextSpan(
                                          text: 'Privacy Policy,',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // code to open / launch terms of service link here
                                            }),
                                      TextSpan(
                                          text: ' and ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    'Promotion of Access to Information.',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // code to open / launch privacy policy link here
                                                      })
                                          ])
                                    ])))),
                          ],
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                onPressed: () {
                  isExpanded = !isExpanded;
                  setState(() {});
                },
                child: Text(
                  isExpanded == true ? "Read Less" : 'Read More',
                  style: TextStyle(color: Constants.ctaColorLight),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            /*  if (isExpanded == false)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, bottom: 12),
                      child: InkWell(
                        onTap: () {
                          isExpanded = true;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Constants.ctaColorLight.withOpacity(0.35),
                            borderRadius: BorderRadius.circular(360),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 12, bottom: 12),
                            child: Center(
                              child: Text(
                                "Read more",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  letterSpacing: 1.05,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "TradeGothic",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),*/

            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor:
                  new AlwaysStoppedAnimation<Color>(Constants.ctaColorLight),
            ),
            SizedBox(width: 16.0),
            Text(
              'Signing In...',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
