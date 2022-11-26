import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rice_geek/widgets/dialog_progress.dart';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();
  final _passwdController = BehaviorSubject<String>();
  bool isSignedUp = true;
  bool isLoading = false;

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get username =>
      _usernameController.stream.transform(validateUsername);
  Stream<String> get passwd =>
      _passwdController.stream.transform(validatePasswd);
  Stream<bool> get loginVaild => CombineLatestStream.combine2(
        email,
        passwd,
        (eml, pwd) => true,
      );
  Stream<bool> get signupValid => CombineLatestStream.combine3(
        email,
        username,
        passwd,
        (eml, usr, pwd) => true,
      );

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePasswd => _passwdController.sink.add;

  void dispose() {
    _emailController.close();
    _usernameController.close();
    _passwdController.close();
  }

  Future submit(bool _isSignedUp, BuildContext context) async {
    final validEmail = _emailController.value;
    final validUsername = _usernameController.value;
    final validPasswd = _passwdController.value;
    UserCredential authResult;

    try {
      showLoaderDialog(context);
      if (_isSignedUp) {
        authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: validEmail,
          password: validPasswd,
        );
      } else {
        authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: validEmail,
          password: validPasswd,
        );
        FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user?.uid)
            .set({
          'username': validUsername,
          'email': validEmail,
        });
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String errMessage =
          e.message ?? "An error occured while trying to login!";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errMessage),
          padding: const EdgeInsets.all(16.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          backgroundColor: Theme.of(context).indicatorColor,
        ),
      );
    }
  }
  // print(validEmail);
  // print(validPasswd);
}
