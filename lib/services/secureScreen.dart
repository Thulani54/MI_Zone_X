import '../Constants/constants.dart';

void secureScreen() async {
  if (Constants.isReleaseMode == true) {
    //  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
}
