import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_disenos1/screens/basic_desing.dart';
import 'package:flutter_disenos1/screens/scroll_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
        title: 'Desing App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'scroll_screen',
        routes: {
          'basic_desing': (BuildContext context) => const BasicDesingScreen(),
          'scroll_screen': (BuildContext context) => const ScrollScreen(),
        }
      )
    ;
  }
}
