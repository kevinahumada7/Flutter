import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Custom
import 'package:flutter_components/src/routes/routes.dart';
//import 'package:flutter_components/src/pages/home_temp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'US'),
        Locale('en', 'US')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: onGenerateRoute
    );
  }
}