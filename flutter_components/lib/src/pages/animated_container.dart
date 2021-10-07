import 'package:flutter/material.dart';
import 'dart:math';


class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: _cambiarForma
      ),
    );
  }

  void _cambiarForma() {
    setState(() {
      _width = Random().nextInt(300).toDouble();
      _height = Random().nextInt(300).toDouble();
      _color = Color.fromRGBO(
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
        1
      );
      _borderRadius = BorderRadius.circular(Random().nextInt(100).toDouble());
    });
  }
}