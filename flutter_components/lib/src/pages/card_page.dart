import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget> [
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("TITULO"),
            subtitle: Text("Descripcion de la tarjeta"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2.0,
            offset: Offset(2, 10)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            const FadeInImage(
              fadeInDuration: Duration(milliseconds: 200),
              placeholder: AssetImage('assets/img/jar-loading.gif'),
              image: NetworkImage('https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2021/05/chainsaw-man-2322987.jpg?itok=ARyE2y8n'),
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text("Chainsaw Man", style: TextStyle(fontSize: 20))
            )
          ],
        ),
      ),
    );
  }
}