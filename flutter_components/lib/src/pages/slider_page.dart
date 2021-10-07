import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 400.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }


  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.pink[300],
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 150.0,
      max: 400.0,
      onChanged: ( _bloquearCheck ) ? null : ( valor ){

        setState(() {
          _valorSlider = valor;
        });

      },
    );

  }

  Widget _checkBox() {

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor){ 
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: const Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){ 
        setState(() {
          _bloquearCheck = valor!;
        });
      },

    );


  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: const Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor){ 
        setState(() {
          _bloquearCheck = valor;
        });
      },

    );
  }


  Widget _crearImagen() {

    return Image(
      image: const NetworkImage('https://i.pinimg.com/originals/25/d8/89/25d88938da3b33a837c9ccb29122cb43.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

}