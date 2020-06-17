import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailinvestplatform/screens/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

FocusNode myFocusNode = new FocusNode();

class _RegisterPage extends State<RegisterPage> {
  String email, password;
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController rePasswordController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();


  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
      body: Form(
        key: formkey,
        child: Column(
          children: <Widget>[

            _buildLogo(),
            _buildUsernameInput(),
            _buildEmailInput(),
            _buildPasswordInput(),
            _buildRePasswordInput(),
            _buildRegisterButton(),
            _buildBackToLoginButton(),

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
              hintText: 'Enter your Username',
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
  Widget _buildEmailInput(){
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
                return 'Please input an email';
              }
            },
            controller: emailController,
            onSaved: (input) => email = input,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              labelText: 'Email',
              hintText: 'Enter your Email',
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
            controller: passwordController,

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
  Widget _buildRePasswordInput(){
    return Expanded(
      flex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.only(bottom: 50.0),
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
            controller: rePasswordController,

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
              labelText: 'Re-Password',
              hintText: 'Enter your re-password',
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
  Widget _buildRegisterButton(){
    return Expanded(
      flex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.only(bottom: 20.0),
        height: 60.0,
        child: StreamBuilder<bool>(
          //stream: bloc.submitCheck,
          builder: (context, snapshot) => RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: changeThePage,
            child: Text(
              'Register Now',
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
  Widget _buildBackToLoginButton(){
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), ModalRoute.withName('/'));
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Already have an Account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: "Sign In",
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
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
          return LoginPage();
        }), ModalRoute.withName('/'));
  }

}