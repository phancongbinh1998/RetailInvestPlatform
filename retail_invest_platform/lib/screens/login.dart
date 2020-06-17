import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:retailinvestplatform/api/project_api_service.dart';
import 'package:retailinvestplatform/api/term_types_api_service.dart';
import 'package:retailinvestplatform/api/user_api_service.dart';
import 'package:retailinvestplatform/models/login_model.dart';
import 'package:retailinvestplatform/models/project_model.dart';
import 'package:retailinvestplatform/screens/register.dart';
import 'package:retailinvestplatform/utils/sign_in.dart';

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
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordlController = new TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  //final bloc = Bloc();
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
//      appBar: AppBar(
//        title: Text('Login'),
//        centerTitle: true,
//        backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
//      ),
      body: Form(
        key: formkey,
        child: Column(
          children: <Widget>[

            _buildLogo(),
            _buildUsernameInput(),
            _buildPasswordInput(),
            _buildLoginButton(),
            _buildTextOR(),
            _buildText(),
            _buildFacebookAndGoogleLoginButton(),
            _buildRegisterButton(),

          ],
        ),
      ),
    );
  }

  Widget _buildLogo(){
    return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage('assets/apple-touch-icon-120x120.png'),
        ),
      ),
    );
  }
  Widget _buildUsernameInput(){
    return Expanded(
      flex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.only(bottom: 20.0),
        child: StreamBuilder<String>(
          //stream: bloc.email,
          builder: (context, snapshot) => TextFormField(
            //onChanged: bloc.emailChanged,
            style: TextStyle(
              color: Colors.white,
            ),
            validator: (usernameController) {
              if (usernameController.isEmpty) {
                return 'Please input an username';
              }
            },
            controller: usernameController,
            onSaved: (input) => email = input,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_pin,
                color: Colors.white,
              ),
              labelText: 'Username',
              hintText: 'Enter your username',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              labelStyle: TextStyle(
                  color:
                  myFocusNode.hasFocus ? Colors.white : Colors.white),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              errorText: snapshot.error,
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildPasswordInput(){
    return Expanded(
      flex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.only(bottom: 20.0),
        child: StreamBuilder<String>(
          //stream: bloc.password,
          builder: (context, snapshot) => TextFormField(
            //onChanged: bloc.passwordChanged,
            style: TextStyle(
              color: Colors.white,
            ),
            validator: (input) {
              if (input.isEmpty) {
                return 'Please provide a password';
              }
            },
            controller: passwordlController,

            onSaved: (input) => password = input,
            focusNode: myFocusNode,
            obscureText: _isHidePassword,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              labelText: 'Password',
              hintText: 'Enter your password',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30.0),
              ),
              labelStyle: TextStyle(
                  color:
                  myFocusNode.hasFocus ? Colors.white : Colors.white),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              errorText: snapshot.error,
              suffixIcon: GestureDetector(
                onTap: () {
                  _togglePasswordVisibility();
                },
                child: Icon(
                  _isHidePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: _isHidePassword ? Colors.white : Colors.white,
                ),
              ),
              //isDense: true,
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildLoginButton(){
    return Expanded(
      flex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.only(bottom: 10.0),
        height: 60.0,
        child: StreamBuilder<bool>(
          //stream: bloc.submitCheck,
          builder: (context, snapshot) => RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: changeThePage,
            child: Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(20, 25, 74, 1),
                fontSize: 20.0,
                letterSpacing: 2.0,
                fontFamily: 'Montserrat',
              ),
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  Widget _buildTextOR(){
    return Expanded(
      flex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.only(bottom: 10.0, top: 20.0),
        height: 60.0,
        child: Text(
          '-OR-',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _buildText(){
    return Expanded(
      flex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        height: 60.0,
        child: Text(
          'Sign in with',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _buildFacebookAndGoogleLoginButton(){
    return Expanded(
      flex: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            //width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(bottom: 20.0),
            height: 70.0,
            child: GestureDetector(
              onTap: () {

              },
              child: Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0,2),
                      blurRadius: 6.0,
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/facebook.png'),
                  )
                ),

              ),
//                  color: Colors.white,
            ),
          ),
          Container(
            //width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(bottom: 20.0),
            height: 70.0,
            child: GestureDetector(
              onTap: () {
                signInWithGoogle().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                });
              },
              child: Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0,2),
                        blurRadius: 6.0,
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/google_logo.png'),
                    )
                ),

              ),
//                  color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildRegisterButton(){
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Don't have an Account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  changeThePage() async {
//    final myService = ProjectApiService.create();
//    final response = await myService.getResource();
//    var post = response.body;
//    print(' ${post.toString()}');
      print('username:' + usernameController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home(inputString: usernameController.text)));


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
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }

}
