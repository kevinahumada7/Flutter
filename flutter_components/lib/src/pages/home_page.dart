import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icon_string_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      initialData: const [],
      future: menuProvider.cargarData(),
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {

        return ListView(
          children: _listItems(snapshot.data!, context),
        );

      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {

    final List<Widget> options = [];

    for (var element in data) { 
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon'], color: Colors.blue),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          /* final route = MaterialPageRoute(builder: (context) => const AlertPage());
          Navigator.push(context, route); */

          Navigator.pushNamed(context, element['ruta']);

        },
      );
      options..add(widgetTemp)
             ..add(const Divider());
    }
    return options;
  }
}