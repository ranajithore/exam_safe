import 'package:exam_safe/components/CustomAlert.dart';
import 'package:exam_safe/components/EmailTextField.dart';
import 'package:exam_safe/components/PasswordTextField.dart';
import 'package:exam_safe/models/app_state.dart';
import 'package:exam_safe/screens/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:exam_safe/models/login_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFromKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> _login(String email, String password) async {
    try {
      final AuthResult user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null)
        return true;
      else
        return false;
    } catch (exception) {
      return false;
    }
  }

  Future _requestCameraAndMicPermission() async {
    await Permission.camera.request();
    await Permission.microphone.request();
  }

  @override
  Widget build(BuildContext context) {
    final LoginState _loginState =
        Provider.of<LoginState>(context, listen: false);
    final AppState _appState = Provider.of<AppState>(context, listen: false);
    print('login');
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-1.0, 0.0),
                  child: SvgPicture.string(
                    _svg_d8vxyj,
                    // allowDrawingOutsideViewBox: true,
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Welcome',
                  style: GoogleFonts.pacifico(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/unlock-800px.png'),
                    ),
                  ),
                ),
                Form(
                  key: this._loginFromKey,
                  child: Column(
                    children: <Widget>[
                      EmailTextField(),
                      PasswordTextField(),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: RaisedButton.icon(
                    label: Text('Login'),
                    icon: Icon(MdiIcons.login),
                    color: Colors.purple,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () async {
                      print('${_loginState.email} ${_loginState.password}');
                      if (!this._loginFromKey.currentState.validate()) return;
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LoadingScreen();
                          });
                      bool isLoginSuccessful = await this
                          ._login(_loginState.email, _loginState.password);
                      Navigator.pop(context);
                      if (isLoginSuccessful) {
                        customAlert(
                            context,
                            AlertType.success,
                            'Login Successful',
                            'You have logged in successfully. Continuing to Moodle.',
                            'OK', () async {
                          Navigator.pushNamed(context, '/loading_screen');
                          await _appState.fetchAllData(_loginState.email);
                          await this._requestCameraAndMicPermission();
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/moodle_screen');
                        }).show();
                      } else {
                        customAlert(
                                context,
                                AlertType.error,
                                'Login Unccessful',
                                'Invalid Email or Password!',
                                'OK',
                                () {})
                            .show();
                      }
                    },
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const color = '#65aadb';
const String _svg_d8vxyj =
    '<svg viewBox="-1.0 0.0 369.4 639.7" ><path  d="M 0 108.310302734375 C 51.34614562988281 160.208984375 106.5432434082031 164.7219085693359 183.5624694824219 154.5678253173828 C 224.613525390625 149.1557159423828 282.5613403320313 154.8136138916016 313.2115173339844 168.1066131591797 C 353.0047607421875 185.0301055908203 368.4086303710938 208.7229766845703 368.4086303710938 208.7229766845703 L 368.4086303710938 0 L 0 0 L 0 108.310302734375 Z" fill="$color" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 368.41, 639.72)" d="M 0 108.310302734375 C 51.48551940917969 160.208984375 106.8324432373047 164.7219085693359 184.0607299804688 154.5678253173828 C 225.2232208251953 149.1557159423828 283.3283081054688 154.8136138916016 314.0616760253906 168.1066131591797 C 353.9629821777344 185.0301055908203 369.4086303710938 208.7229766845703 369.4086303710938 208.7229766845703 L 369.4086303710938 0 L 0 0 L 0 108.310302734375 Z" fill="$color" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
