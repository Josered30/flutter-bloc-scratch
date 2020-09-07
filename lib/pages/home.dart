import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_pattern_scratch/bloc/animes_bloc.dart';
import 'package:flutter_bloc_pattern_scratch/bloc/generic_bloc_provider.dart';
import 'package:flutter_bloc_pattern_scratch/widgets/anime_list.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  final String username;
  Home({this.username});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final controller = TextEditingController();
  final client = Client();

  AnimeBloc animeBloc;

  @override
  Widget build(BuildContext context) {
    animeBloc = BlocProvider.of(context);

    return WillPopScope(
      onWillPop: () => SystemNavigator.pop(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'Home',
              style: TextStyle(),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.logout),
          ),
          body: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                    child: TextField(
                      style: Theme.of(context).textTheme.subtitle1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        hintText: 'Search',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]),
                        ),
                      ),
                      controller: controller,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      if (controller.text.isNotEmpty) {
                        animeBloc.getAnimes(controller.text, client);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            AnimeList(),
          ])),
    );
  }
}
