import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

  final String text;
<<<<<<< HEAD
  final Function()? onPressed;

=======
  final void Function() onPressed;
  
>>>>>>> 088cb63d4ad66606084363a60bd0d34d23caa4fa
  const BotonAzul({
    Key? key, 
    required this.text, 
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
        child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text( this.text , style: TextStyle( color: Colors.white, fontSize: 17 )),
          ),
        ),
    );
  }

}