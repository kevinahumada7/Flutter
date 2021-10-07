import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  final List<String> _personajes = ['Nezuko','Subaru', 'Kazuma', 'Kaneki', 'Rimuru','Levi'];
  String _optionSelected = 'Nezuko';
  final TextEditingController _inputDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo ingresar el nombre',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle_rounded)
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;  
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        counter: Text('Letras ${_email.length}'),
        hintText: 'Casilla de correo',
        labelText: 'Email',
        helperText: 'Ingresar casilla de correo',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email)
      ),
      onChanged: (value) {
        setState(() {
          _email = value;  
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        counter: Text('Letras ${_password.length}'),
        hintText: 'Contraseña',
        labelText: 'Clave',
        helperText: 'Ingresar contraseña de la cuenta',
        suffixIcon: const Icon(Icons.password),
        icon: const Icon(Icons.lock)
      ),
      onChanged: (value) {
        setState(() {
          _password = value;  
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        helperText: 'Ingresar contraseña de la cuenta',
        suffixIcon: const Icon(Icons.perm_contact_cal),
        icon: const Icon(Icons.calendar_today)
      ),
      onTap: () {

        FocusScope.of(context).requestFocus( FocusNode() );
        _selectDate(context);

      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'US'),
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Seleccionar fecha de nacimiento',
      cancelText: 'Cancelar',
      confirmText: 'Aceptar',
      fieldLabelText: 'Fecha de nacimiento',
    );

    if (picked != null) {
      setState(() {
        _fecha = DateFormat('dd-MM-yyyy').format(picked);
        _inputDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = [];

    for (var personajes in _personajes) {
      list.add(DropdownMenuItem(
        child: Text(personajes),
        value: personajes,
        alignment: AlignmentDirectional.center,
      ));
    }

    return list;
  }


  Widget _crearDropdown() {
    return Row(
      children: [
        const Icon(Icons.bubble_chart_outlined),
        const SizedBox(width: 5),
        const Text("Personajes de anime: "),
        const SizedBox(width: 15),
        Expanded(
          child: DropdownButton(
            value: _optionSelected,
            items: getOptionsDropdown(),
            onChanged: (option) {
              setState(() {
                _optionSelected = option.toString();
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return Column(
      children: [
        ListTile(
          title: Text('Nombre: $_nombre'),
          trailing: Text('Personaje favorito: $_optionSelected'),
        ),
        ListTile(
          title: Text('Email: $_email'),
          subtitle: Text('Clave: $_password'),
        ),
      ],
    );
  }

}