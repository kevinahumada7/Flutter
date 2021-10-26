import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: cardShape(),
          child: child,
        ),
      ),
    );
  }

  BoxDecoration cardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5)
      )
    ]

  );
}