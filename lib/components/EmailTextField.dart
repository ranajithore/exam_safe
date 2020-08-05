import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:exam_safe/models/login_state.dart';
import 'package:provider/provider.dart';

class EmailTextField extends StatefulWidget {
  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}


class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    final LoginState _loginState =
        Provider.of<LoginState>(context, listen: false);
    print('email');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          labelText: 'Email',
          hintText: 'Enter your registered email',
          prefixIcon: Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (email) {
          if (email.length < 1)
            return null;
          else if (!EmailValidator.validate(email, true))
            return 'Not a valid email';
          else
            return null;
        },
        autovalidate: true,
        onChanged: (change) => _loginState.setEmail(change),
      ),
    );
  }
}
