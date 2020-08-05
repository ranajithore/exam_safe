import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert customAlert(BuildContext context, AlertType alertType, String title,
    String desc, String buttonText, Function aftterOnPress) {
  return Alert(
    context: context,
    type: alertType,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pop(context);
          aftterOnPress();
        },
        width: 120,
      )
    ],
  );
}
