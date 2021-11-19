import 'dart:convert';
import 'package:chat/global/environment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  late Usuario usuario;
  final _storage = FlutterSecureStorage();
  bool _auth = false;

  bool get auth => _auth;
  set auth(bool value) {
    _auth = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final _storage = FlutterSecureStorage();
    final token = (kIsWeb) ? _prefs.getString('token') ?? '' : await _storage.read(key: 'token');
    return token!;
  }

  static Future<String?> deleteToken() async {

      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      final _storage = FlutterSecureStorage();
      (kIsWeb) ? await _prefs.remove('token') : await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    try {
      auth = true;

      final data = {"email": email, "password": password};

      final uri = Uri.parse('${Environment.apiUrl}/login');
      final response = await http.post(uri, body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
      });
      print(response.body);
      auth = false;

      if (response.statusCode == 200) {
        final loginResponse = loginResponseFromJson(response.body);
        usuario = loginResponse.usuario;

        await _saveToken(loginResponse.token);
        
        return true;

      } else {
        print(response.statusCode);
        return false;
      }
    } catch (e) {
      auth = false;
      print(e);
      return false;
    }
  }

  Future register(String nombre, String email, String password) async {
    try {
      this.auth = true;
      final data = {'nombre': nombre, 'email': email, 'password': password};

      final uri = Uri.parse('${Environment.apiUrl}/login/new');
      final resp = await http.post(uri,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      this.auth = false;

      if (resp.statusCode == 200) {
        final loginResponse = loginResponseFromJson(resp.body);
        this.usuario = loginResponse.usuario;
        await this._saveToken(loginResponse.token);

        return true;
      } else {
        final respBody = jsonDecode(resp.body);
        return respBody['msg'];
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    try {

      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      final token = (kIsWeb) ? _prefs.getString('token') ?? '' : await _storage.read(key: 'token');

      final uri = Uri.parse('${Environment.apiUrl}/login/renew');
      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'x-token': token!});

      if (resp.statusCode == 200) {
        final loginResponse = loginResponseFromJson(resp.body);
        this.usuario = loginResponse.usuario;
        await this._saveToken(loginResponse.token);
        return true;
      } else {
        print(resp.statusCode);
        return false;
      }
    } catch (e) {
      print(e);
      this.logout();
      return false;
    }
  }

  Future _saveToken(String token) async {
    if (kIsWeb) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      return await _prefs.setString('token', token);
    }
    
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    (kIsWeb) ? await _prefs.remove('token') : await _storage.delete(key: 'token');
  }
}
