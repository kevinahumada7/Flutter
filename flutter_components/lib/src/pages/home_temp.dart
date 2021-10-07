import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({Key? key}) : super(key: key);

  final options = ['Uno','Dos','Tres','Cuatro','Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World!"),
      ),
      body: ListView(
        children: _createItemsShort()
      )
    );
  }

  // ignore: unused_element
  List<Widget> _createItems() {

    List<Widget> list = <Widget>[];

    for (var option in options) {
      final tempWidget = ListTile(
        title: Text(option),
      );

      list..add(tempWidget)
          ..add(const Divider());
    }

    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((e) => Column(
      children: [
        ListTile(
          title: Text(e),
          subtitle: const Text('Subtitulo'),
          leading: const Icon(Icons.person),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        const Divider()
      ],
    )).toList();
  }
}