import 'package:flutter/foundation.dart';

class LoginState extends ChangeNotifier {
  String _email;
  String _password;

  // Getters
  String get email => _email;
  String get password => _password;

  // Setters
  void setEmail(String email) {
    this._email = email;
    notifyListeners();
  }
  void setPassword(String password) {
    this._password = password;
    notifyListeners();
  }
}