import 'package:flutter/material.dart';

//Routes
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/animated_container.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/input_page.dart';
import 'package:flutter_components/src/pages/listview_page.dart';
import 'package:flutter_components/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes () {
  return <String, WidgetBuilder> {
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animatedContainer': (BuildContext context) => const AnimatedContainerPage(),
    'inputs': (BuildContext context) => const InputPage(),
    'slider': (BuildContext context) => const SliderPage(),
    'list': (BuildContext context) => const ListPage(),
  };
}

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  // ignore: avoid_print
  print("Error en la llamada a la ruta: ${settings.name}");

  return MaterialPageRoute(builder: (BuildContext context) => const AlertPage());
}