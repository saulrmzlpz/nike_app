import 'package:flutter/services.dart' as services;

class Helpers {
  static void changeLightStatusBar() {
    services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.light);
  }

  static void changeDarkStatusBar() {
    services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.dark);
  }
}
