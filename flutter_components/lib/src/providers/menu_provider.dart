import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class _MenuProvider {

  List<dynamic> options = [];

  _MenuProvider();

  Future<List<dynamic>> cargarData() async {
    final request = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(request);
    options = dataMap['rutas'];

    return options;
  }
}

final menuProvider = _MenuProvider();