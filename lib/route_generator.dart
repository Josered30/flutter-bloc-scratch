import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_scratch/bloc/animes_bloc.dart';
import 'package:flutter_bloc_pattern_scratch/bloc/generic_bloc_provider.dart';
import 'package:flutter_bloc_pattern_scratch/pages/details.dart';
import 'package:flutter_bloc_pattern_scratch/pages/home.dart';
import 'package:flutter_bloc_pattern_scratch/pages/login.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Login());
      case '/home':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  child: Home(
                    username: '' /*arg['username']*/,
                  ),
                  bloc: AnimeBloc(),
                ));
      case '/details':
        return MaterialPageRoute(
            builder: (context) => Details(
                  anime: arg['anime'],
                ));
    }

    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
