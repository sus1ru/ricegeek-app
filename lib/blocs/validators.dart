import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Please enter a valid email!');
      }
    },
  );
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
    handleData: (username, sink) {
      if (username.length > 4) {
        sink.add(username);
      } else {
        sink.addError('Please read the password criteria!');
      }
    },
  );

  final validatePasswd = StreamTransformer<String, String>.fromHandlers(
    handleData: (passwd, sink) {
      if (passwd.length > 4) {
        sink.add(passwd);
      } else {
        sink.addError('Please read the password criteria!');
      }
    },
  );
}
