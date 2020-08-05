import 'package:flutter/material.dart';
import 'package:exam_safe/models/login_state.dart';
import 'package:provider/provider.dart';

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final LoginState _loginState =
        Provider.of<LoginState>(context, listen: false);
    print('password');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
      child: TextFormField(
        obscureText: !this._passwordVisible,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          labelText: 'Password',
          hintText: 'Enter password',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              this._passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                this._passwordVisible = !this._passwordVisible;
              });
            },
          ),
        ),
        validator: (password) {
          if (password.length < 1)
            return null;
          else if (password.length < 6)
            return 'Minimum 6 characters';
          else
            return null;
        },
        autovalidate: true,
        onChanged: (change) => _loginState.setPassword(change),
      ),
    );
  }
}
