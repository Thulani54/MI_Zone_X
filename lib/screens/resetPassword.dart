import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../customwidgets/custom_input.dart';

class resetPassword extends StatefulWidget {
  const resetPassword();

  @override
  _resetPasswordState createState() => _resetPasswordState();
}

String _loginEmail = "";
late FocusNode _emailFocusNode;

class _resetPasswordState extends State<resetPassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            elevation: 6,
            leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Reset Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          width: 450,
          constraints: BoxConstraints(
            maxWidth: 550,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    "lib/assets/logo_main.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                      top: 12.0,
                      left: 24,
                      right: 24,
                    ),
                    height: 1,
                    color: Colors.grey.withOpacity(0.15)),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                      "Enter your registered email below to receive password instruction ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7))),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomInput(
                    hintText: "Account Email",
                    onChanged: (value) {
                      _loginEmail = value;
                    },
                    onSubmitted: (value) {
                      //_login.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    isPasswordField: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.ctaColorLight,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Constants.ctaColorLight),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      child: Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width < 500
                              ? 32
                              : MediaQuery.of(context).size.width < 1100 &&
                                      MediaQuery.of(context).size.width < 1100
                                  ? 40
                                  : 45,
                          child: Center(
                              child: Text(
                            "Send reset password email",
                            style: GoogleFonts.inter(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ))),
                      onPressed: () {
                        _submitForm();
                      },
                      style: TextButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "MI Fintech \u00a9 ${DateTime.now().year}.All rights reserved",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    // _incrementCounter();

    super.initState();
  }

  Future<String?> _submitForm() async {
    try {} catch (e) {
      return (e.toString());
    }
  }
}
