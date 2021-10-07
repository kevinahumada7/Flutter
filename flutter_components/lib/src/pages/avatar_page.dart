import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://static.wikia.nocookie.net/bokunoheroacademia/images/5/50/Himiko_Toga%27s_Quirk_deactivated.png/revision/latest/scale-to-width-down/250?cb=20181030153843')
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              child: Text("K7"),
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/img/jar-loading.gif'),
          image: NetworkImage('http://pm1.narvii.com/7640/85fdf6dccc48cd5994d2c89ef429496ea002ff96r1-720-720v2_uhq.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}