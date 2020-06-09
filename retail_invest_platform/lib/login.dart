import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

FocusNode myFocusNode = new FocusNode();

class _LoginPageState extends State<LoginPage> {
  String email, password;
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Login'),
//      ),
//      body: Form(
//        key: formkey,
//        child: Column(
//          children: <Widget>[
//            TextFormField(
//              validator: (input){
//                if(input.isEmpty){
//                  return 'Please type an email';
//                }
//              },
//              onSaved: (input) => email = input,
//              decoration: InputDecoration(
//                labelText: 'Email'
//              ),
//            ),
//            TextFormField(
//              validator: (input){
//                if(input.isEmpty){
//                  return 'Please provide a password';
//                }
//              },
//              onSaved: (input) => password = input,
//              decoration: InputDecoration(
//                  labelText: 'Password'
//              ),
//              obscureText: true,
//            ),
//            RaisedButton(
//              onPressed: signIn,
//              child: Text('Sign in'),
//            )
//          ],
//        ),
//      ),
//    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/apple-touch-icon-120x120.png'),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      print('>>>');
                      return 'Please type an username';
                    }
                  },
                  onSaved: (input) => email = input,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: const Color.fromRGBO(20, 25, 74, 1),
                    )),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? const Color.fromRGBO(20, 25, 74, 1)
                            : Colors.grey),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please provide a password';
                    }
                  },
                  onSaved: (input) => password = input,
                  focusNode: myFocusNode,
                  obscureText: _isHidePassword,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: const Color.fromRGBO(20, 25, 74, 1),
                    )),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? const Color.fromRGBO(20, 25, 74, 1)
                            : Colors.grey),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _togglePasswordVisibility();
                      },
                      child: Icon(
                        _isHidePassword ? Icons.visibility_off : Icons.visibility,
                        color: _isHidePassword
                            ? Colors.grey
                            : const Color.fromRGBO(20, 25, 74, 1),
                      ),
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(bottom: 10.0),
                height: 60.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: signIn,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  color: const Color.fromRGBO(20, 25, 74, 1),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(bottom: 20.0),
                height: 70.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: () {
                    print('Click');
                  },
                  child: Text(
                    'Sign in with Google+',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  color: const Color.fromRGBO(221, 75, 57, 1),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: Container(
                      child: Text(
                        "Don't have account yet?",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(221, 75, 57, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = formkey.currentState;

    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: email.trim(), password: password))
            .user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
