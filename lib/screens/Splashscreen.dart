import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/constants.dart';
import '../services/secureScreen.dart';
import '../services/sharedPrefs.dart';
import 'Login.dart';
import 'OnBoardingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              /*  if (Constants.currentBusinessInfo.logo.isNotEmpty)
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: Constants.currentBusinessInfo.logo,
                    */ /*   placeholder: (context, url) => Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()),*/ /*
                    // errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),*/
              // if(Constants.currentBusinessInfo.)

              Spacer(),
              SpinKitDualRing(
                color: Constants.ctaColorLight,
                size: 60.0,
                lineWidth: 2,
              ),
              Spacer(),
              Text(
                "Copyright (c) 2012-2023 MI Group.",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    //Constants.account_type = "sales_agent";

    secureScreen();
    Sharedprefs.getUserLoggedInSharedPreference().then((value) {
      Constants.screenWidth = MediaQuery.of(context).size.width;
      Constants.screenHeight = MediaQuery.of(context).size.height;
      if (value != null) Constants.isLoggedIn = value;
      if (kDebugMode) {
        print("valuerdg $value");
      }

      Sharedprefs.getUserNameSharedPreference().then((value) {
        if (value != null) Constants.myDisplayname = value.toString();
      });

      Sharedprefs.getUserEmailSharedPreference().then((value) {
        if (value != null) Constants.myEmail = value.toString();
      });
      Sharedprefs.getUserCellSharedPreference().then((value) {
        if (value != null) Constants.myCell = value.toString();
      });
      Sharedprefs.getUserUidSharedPreference().then((value) {
        if (value != null) Constants.myUid = value.toString();
        if (kDebugMode) {
          print("value $value");
        }
      });

      Future.delayed(Duration(seconds: 6), () {
        print("hgjdgf ${Constants.new_timesOpened}");
        if (Constants.new_timesOpened == 0 || Constants.showOnboardingScreen) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => OnBoardingPage()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
      });

      super.initState();
    });
  }
}
