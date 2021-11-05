import 'dart:convert';
import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {

  late Usuario usuario;
  bool _auth = false;
  final _storage = FlutterSecureStorage();

  bool get auth => _auth;
  set auth(bool value) {
    _auth = value;
    notifyListeners(); 
  }

  static Future<String?> getToken() async {
    final _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<String?> deleteToken() async {
    final _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {

    auth = true;

    final data = {
      "email" : email,
      "password" : password
    };

    final uri = Uri.parse('${Environment.apiUrl}/login');
    final response = await http.post(uri,
      body: jsonEncode(data),
      headers: {
        'Content-Type':'application/json',
      }
    );
    print(response.body);
    auth = false;

    if(response.statusCode == 200){
      final loginResponse = loginResponseFromJson(response.body);
      usuario = loginResponse.usuario;

      await _saveToken(loginResponse.token); 

      return true;
    } else {
      return false;
    }

  }

  Future register(String nombre, String email, String password ) async {

    this.auth = true;

    final data = {
      'nombre': nombre,
      'email': email,
      'password': password
    };

    final uri = Uri.parse('${ Environment.apiUrl }/login/new');
    final resp = await http.post(uri, 
      body: jsonEncode(data),
      headers: { 'Content-Type': 'application/json' }
    );

    this.auth = false;

    if ( resp.statusCode == 200 ) {
      final loginResponse = loginResponseFromJson( resp.body );
      this.usuario = loginResponse.usuario;
      await this._saveToken(loginResponse.token);

      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }

  }

  Future<bool> isLoggedIn() async {

    final token = await this._storage.read(key: 'token') ?? '';

    final uri = Uri.parse('${ Environment.apiUrl }/login/renew');
    final resp = await http.get(uri, 
      headers: { 
        'Content-Type': 'application/json',
        'x-token': token
      }
    );

    if ( resp.statusCode == 200 ) {
      final loginResponse = loginResponseFromJson( resp.body );
      this.usuario = loginResponse.usuario;
      await this._saveToken(loginResponse.token);
      return true;
    } else {
      this.logout();
      return false;
    }

  }

  //Sacar
  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  //Sacar
  Future logout() async {
    await _storage.delete(key: 'token');
  }
}