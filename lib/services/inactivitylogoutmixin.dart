import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/Constants.dart';
import '../screens/Login.dart';

mixin InactivityLogoutMixin<T extends StatefulWidget> on State<T> {
  Timer? _countdownTimer;
  int _countdown = 10;

  void startInactivityTimer() {
    Constants.inactivityTimer?.cancel();
    Constants.inactivityTimer =
        Timer(const Duration(minutes: 3), () => _showLogoutDialog());
  }

  void restartInactivityTimer() {
    _countdownTimer?.cancel();
    Constants.inactivityTimer?.cancel();
    startInactivityTimer();
  }

  void _showLogoutDialog() {
    _countdown = 10; // Reset countdown
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            _countdownTimer?.cancel();
            _countdownTimer =
                Timer.periodic(const Duration(seconds: 1), (timer) {
              if (_countdown > 0) {
                setState(() {
                  _countdown--;
                });
              } else {
                timer.cancel();
                Navigator.of(context).pop(); // Close the dialog
                _signOut();
              }
            });

            return AlertDialog(
              title: const Text('Inactive Session'),
              content: Text('You will be signed out in $_countdown seconds.'),
              actions: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                              color: Constants.ctaColorLight,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _resetTimer();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Constants.ctaColorLight,
                                borderRadius: BorderRadius.circular(360)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, right: 14, top: 5, bottom: 5),
                              child: const Text(
                                'Continue',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
    ).then((_) {
      _countdownTimer
          ?.cancel(); // Ensure the timer is cancelled when the dialog is dismissed
    });
  }

  void _resetTimer() {
    // _inactivityTimer?.cancel();
    _countdownTimer?.cancel();
    const additionalTime = Duration(minutes: 1);
    Constants.inactivityTimer = Timer(
        const Duration(minutes: 2) + additionalTime, () => _showLogoutDialog());
    // startInactivityTimer();
  }

  void _signOut() {
    print("User has been signed out due to inactivity");
    for (int i = 1; i <= Constants.pageLevel; i++) {
      print("Went back $i");
      Navigator.of(context).pop();
    }
    Constants.isLoggedIn = true;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  void dispose() {
    Constants.inactivityTimer?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }
}
