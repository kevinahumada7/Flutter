import 'dart:io';

import 'package:flutter/foundation.dart';

class Environment {
  static String apiUrl = (!kIsWeb && Platform.isAndroid) ? 'http://10.0.2.2:5485/api' : 'http://localhost:5485/api';
  static String socketUrl = (!kIsWeb && Platform.isAndroid) ? 'http://10.0.2.2:5485' : 'http://localhost:5485';
}