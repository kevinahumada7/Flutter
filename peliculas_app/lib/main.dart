import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_app/pages/pages.dart';

import 'package:provider/provider.dart';
import 'package:peliculas_app/providers/movies_provider.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //lazy true: espera a que el provider sea necesitado para inicializarse
        //lazy false: se inicializa al crearse el widget
        ChangeNotifierProvider( lazy: false ,create: (BuildContext context) => MoviesProvider())
      ],
      child: const MyApp(),
    );
  }
}

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
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
        )
      ),
    );
  }
}