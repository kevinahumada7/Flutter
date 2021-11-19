import 'dart:io';

import 'package:flutter/foundation.dart';

class Environment {
  static String apiUrl = (!kIsWeb && Platform.isAndroid) ? 'http://10.0.2.2:3200/api' : 'http://localhost:3200/api';
  static String socketUrl = (!kIsWeb && Platform.isAndroid) ? 'http://10.0.2.2:3200' : 'http://localhost:3200';
}