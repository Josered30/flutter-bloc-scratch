import 'dart:async';

import 'package:flutter_bloc_pattern_scratch/bloc/generic_bloc_provider.dart';
import 'package:flutter_bloc_pattern_scratch/services/login_service.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators implements BlocBase {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  StreamSink<String> get emailChange => _emailController.sink;
  StreamSink<String> get passwordChange => _passwordController.sink;

  Stream<String> get emailState =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get passwordState =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck =>
      Rx.combineLatest2(emailState, passwordState, (e, p) {
        return true;
      });

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
