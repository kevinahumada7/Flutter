import 'package:flutter/material.dart';
import 'package:form_app/interface/input_decorations.dart';
import 'package:form_app/provider/login_provider.dart';
import 'package:form_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.35),
              CardContainer(child: Column(
                children: [
                  Text('Login', style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 20),
                  ChangeNotifierProvider(create: (_) => LoginFormProvider(), child: const _LoginForm()),

                ])
              ),

              const SizedBox(height: 50),
              const Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 50),
            ],
          ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) => loginForm.email,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(prefixIcon: Icons.alternate_email, labelText:'Correo Electronico', hintText:'usuario@dominio.com'),
            validator: (value) {
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp  = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'Correo electronico invalido';
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            onChanged: (value) => loginForm.password,
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(prefixIcon: Icons.lock, labelText:'Contraseña', hintText:'************'),
            validator: (value) {
              return ( value != null && value.length >=6) 
              ? null
              : 'Contraseña invalida';
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.pink,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
            ),
            onPressed: () {
              if(!loginForm.isValidForm()) return;
              Navigator.pushReplacementNamed(context, 'home');
            }
          )
        ],
      ),
    );
  }
}