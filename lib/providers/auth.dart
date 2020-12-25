import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

// data types
import '../data_types/response.dart';

class Auth with ChangeNotifier {
  // final baseUrl = 'full-basket-back-end.herokuapp.com';
  final baseUrl = 'localhost:8080';

  var _user;
  String token;
  String _initialView = '';

  String get initialView {
    return _initialView;
  }

  String get userName {
    return _user['firstName'];
  }

/////////////////////////////////////////// Persistent Data function ///////////////////////////////////////////

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> setToken({@required token}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<void> setInitialView({@required view}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('initialView', view);
  }

  /*
   * gets cached data
   */
  Future<void> initial() async {
    final prefs = await SharedPreferences.getInstance();
    // check for token
    if (prefs.containsKey('token')) {
      token = prefs.getString('token');
      if (prefs.containsKey('initialView')) {
        _initialView = prefs.getString('initialView');
      }
    }
    notifyListeners();
  }

/////////////////////////////////////////// Auth Functions  ///////////////////////////////////////////

  /*
   * gets valid auth token
   */
  Future<Response> logIn({String email, String password}) async {
    try {
      var url = new Uri.https(baseUrl, '/auth/login');
      var res = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-type': 'application/json'},
      );

      final data = json.decode(res.body);
      if (res.statusCode == 200) {
        // fetch user data
        token = data['token'];

        await setToken(token: token);
        // may compile
        await setInitialView(view: '/category');
        notifyListeners();

        return Response(
          success: true,
          message: data['message'],
        );
      } else {
        return Response(
          success: false,
          message: data['message'],
        );
      }
    } catch (error) {
      print(error);
      return Response(
        success: false,
        message: Response.defaultFailMessage,
      );
    }
  }

  /*
   * Get user info ( only user's first name used )
   */
  Future<Response> getUserInfo() async {
    try {
      var url = new Uri.https(baseUrl, 'auth/users');
      var res = await http.get(url, headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      var data = json.decode(res.body);
      if (res.statusCode == 200) {
        _user = data['user'];
        notifyListeners();
        return Response(
          success: true,
          message: data['message'],
        );
      } else {
        return Response(
          success: false,
          message: data['message'],
        );
      }
    } catch (error) {
      print(error);
      return Response(
        success: false,
        message: Response.defaultFailMessage,
      );
    }
  }

  /*
   * sets user to null 
   */

  void logOut() {
    _user = null;
    token = '';
    print(_user);
    print(token);
  }
}
