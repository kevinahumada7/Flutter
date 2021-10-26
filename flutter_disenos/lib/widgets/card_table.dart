import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(color: Colors.blue, text: 'General', icon: Icons.border_all),
            _SingleCard(color: Colors.green, text: 'Transport', icon: Icons.emoji_transportation),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(color: Colors.teal, text: 'Gastos', icon: Icons.bar_chart),
            _SingleCard(color: Colors.amber, text: 'Guardado', icon: Icons.bookmark),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(color: Colors.brown, text: 'ID', icon: Icons.badge),
            _SingleCard(color: Colors.cyan, text: 'Renovar', icon: Icons.autorenew),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(color: Colors.indigo, text: 'Recientes', icon: Icons.auto_awesome_mosaic_rounded),
            _SingleCard(color: Colors.pink, text: 'Inversiones', icon: Icons.attach_money),
          ]
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({Key? key, required this.icon, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(icon, size: 35, color: Colors.white,),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Text(text, style: TextStyle(color: color, fontSize: 18),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}