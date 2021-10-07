import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Mostrar Alerta"),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: const StadiumBorder()
          ),
          onPressed: () => _mostrarAlert(context) ,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Descripcion"),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("Aceptar"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }
}