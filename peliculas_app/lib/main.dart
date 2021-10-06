import 'package:flutter/material.dart';
import 'package:peliculas_app/pages/pages.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'details': (_) => const DetailsPage(),
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.red[900],
          centerTitle: true
        )
      ),
    );
  }
}