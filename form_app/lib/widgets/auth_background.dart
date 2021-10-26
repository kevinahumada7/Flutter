import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _BackgroundBox(),
          child,
        ],
      ),
    );
  }
}

class _BackgroundBox extends StatelessWidget {
  const _BackgroundBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _boxDecorationBackground(),
      child: Stack(
        children: [
          _HeaderIcon(size: size),
          const Positioned(child: _Bubble(), top: 90, left: 50),
          const Positioned(child: _Bubble(), top: -40, left: -30),
          const Positioned(child: _Bubble(), top: -10, right: -20),
          const Positioned(child: _Bubble(), bottom: -30, left: 10),
          const Positioned(child: _Bubble(), bottom: 60, right: 20),
        ],
      ),
    );
  }

  BoxDecoration _boxDecorationBackground() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: size.height * 0.05),
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100 )
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05)
      )
    );
  }
}