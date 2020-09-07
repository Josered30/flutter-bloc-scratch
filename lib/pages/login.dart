import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_scratch/bloc/login_bloc.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final bloc = LoginBloc();


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 120.0, horizontal: 40.0),
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  StreamBuilder<Object>(
                      stream: bloc.emailState,
                      builder: (context, snapshot) {
                        return TextFormField(
                          key: Key("Email field"),
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.bodyText1,
                            hintText: 'Enter your email',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]),
                            ),
                            errorText: snapshot.error,        
                          ),
                          validator: (value) {
                            /*if (value.isEmpty) {
                            return 'Please enter some text';
                          }*/
                            return null;
                          },
                          onChanged: (s) => bloc.emailChange.add(s),
                        );
                      }),
                  SizedBox(
                    height: 30.0,
                  ),
                  StreamBuilder<Object>(
                      stream: bloc.passwordState,
                      builder: (context, snapshot) {
                        return TextFormField(
                            key: Key("Password field"),
                            style: Theme.of(context).textTheme.bodyText1,
                            decoration: InputDecoration(
                                hintStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                hintText: 'Enter your password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200]),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200]),
                                ),
                                errorText: snapshot.error                        
                                ),
                            validator: (value) {
                              /*if (value.isEmpty) {
                            return 'Please enter some text';
                            }*/
                              return null;
                            },
                            onChanged: (s) => bloc.passwordChange.add(s),
                            obscureText: true);
                      }),
                  SizedBox(
                    height: 80.0,
                  ),
                  StreamBuilder<Object>(
                      stream: bloc.submitCheck,
                      builder: (context, snapshot) {
                        return RaisedButton(
                          key: Key("Login buttom"),
                          color: Theme.of(context).buttonColor,
                          onPressed: () {
                            if (snapshot.hasData) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          child: Text(
                            'Login',
                          ),
                        );
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
