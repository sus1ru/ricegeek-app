import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rice_geek/blocs/bloc.dart';
import 'package:rice_geek/blocs/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isSignedUp = true;
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          margin: const EdgeInsets.all(20.0),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.2,
            right: 24,
            left: 24,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                _isSignedUp ? 'Login' : 'Signup',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 24.0),
              emailField(bloc),
              const SizedBox(height: 20.0),
              passwordField(bloc),
              if (!_isSignedUp) const SizedBox(height: 24.0),
              if (!_isSignedUp) userName(bloc),
              const SizedBox(height: 24.0),
              submitButton(bloc),
              const SizedBox(height: 16.0),
              _isSignedUp
                  ? createAccount('Create an Account?')
                  : createAccount('Already have an Account?'),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          key: ValueKey('email'),
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: 'apple@oranges.com',
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 18.0),
            helperText: "",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            errorText: snapshot.hasError ? snapshot.error as String : null,
          ),
        );
      },
    );
  }

  Widget userName(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.username,
      builder: (context, snapshot) {
        return TextField(
          key: ValueKey('username'),
          onChanged: bloc.changeUsername,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: 'John Doe',
            labelText: 'Username',
            labelStyle: TextStyle(fontSize: 18.0),
            helperText: "",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            errorText: snapshot.hasError ? snapshot.error as String : null,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.passwd,
      builder: (context, snapshot) {
        return TextField(
          key: ValueKey('password'),
          onChanged: bloc.changePasswd,
          obscureText: true,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: 'ily123',
            labelText: 'Password',
            labelStyle: TextStyle(fontSize: 18.0),
            helperText: "",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            errorText: snapshot.hasError ? snapshot.error as String : null,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: _isSignedUp ? bloc.loginVaild : bloc.signupValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData
              ? () {
                  FocusScope.of(context).unfocus();
                  bloc.submit(_isSignedUp, context);
                }
              : null,
          child: Text(_isSignedUp ? 'Log in' : 'Sign up'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50.0),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        );
      },
    );
  }

  Widget createAccount(String accountStatus) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
      onPressed: () => setState(() {
        _isSignedUp = !_isSignedUp;
      }),
      child: Text(accountStatus),
    );
  }
}
