import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explcit
  double amount = 150.0;
  double size = 250.0;
  String emailString, passwordString;
  final formkey = GlobalKey<FormState>(); //Store email and password data

  bool checkSpace(String value) {
    // check space input from email and password
    bool result = false;
    if (value.length == 0) {
      // have space
      result = true;
    }
    return result;
  }

  Widget showLogo() {
    return Container(
      width: amount,
      height: amount,
      child: Image.asset(
        'images/logo.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget showName() {
    return Container(
      child: Text(
        'Smart Crab',
        style: TextStyle(
          fontSize: 50.0,
          color: Colors.orange[800],
          fontWeight: FontWeight.bold,
          fontFamily: 'FC Galaxy Regular',
        ),
      ),
    );
  }

  Widget emailTextFormFeild() {
    return Container(
      width: size,
      child: TextFormField(
        style: TextStyle(
          color: Colors.orange[600],
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              size: 40.0,
              color: Colors.orange[600],
            ),
            labelText: 'User:',
            labelStyle: TextStyle(
              color: Colors.orange[600],
            ),
            hintText: 'abcd@email.com'),
        validator: (String value) {
          if (checkSpace(value)) {
            return 'Please Type in Email';
          }
        },
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: size,
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          color: Colors.orange[600],
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              size: 40.0,
              color: Colors.orange[600],
            ),
            labelText: 'Password:',
            labelStyle: TextStyle(
              color: Colors.orange[600],
            ),
            hintText: 'More 6 Charactor'),
        validator: (String value) {
          if (checkSpace(value)) {
            return 'Password Empty';
          }
        },
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Widget signInButton(BuildContext context) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          print('you click login');
          formkey.currentState.save();
          print('email=$emailString,password = $passwordString');
        },
        color: Colors.orange[500],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment(0, -1),
        padding: EdgeInsets.only(top: 70.0),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              showLogo(),
              showName(),
              emailTextFormFeild(),
              passwordText(),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                width: 100,
                child: Row(
                  children: <Widget>[
                    signInButton(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
