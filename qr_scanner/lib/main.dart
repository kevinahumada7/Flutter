import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/home.dart';
import 'package:qr_scanner/pages/map.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( BuildContext context) => UiProvider())
      ],
      child: MaterialApp(
        title: 'QRScanner',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => const HomePage(),
          'map': (BuildContext context) => const MapPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.teal
        )
        
      ),
    );
  }
}