import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_scratch/models/anime.dart';
import 'package:intl/intl.dart';


class Details extends StatelessWidget {

  final Anime anime;
  Details({this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          anime.name,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Theme.of(context).accentColor,
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0,),
                Image.network(
                    anime.imageUrl,
                    height: 200.0,
                   
                ),
                SizedBox(height: 30.0,),
                Text(
                  anime.synopsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Episodes: ${anime.episodes.toString()}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Score: ${anime.score.toString()}',
                  style:Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Release date: ${ DateFormat.yMd().format(anime.releaseDate)}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 20.0,),

              ],
            ),
          ) ,
        ),
      ),
    );

  }
}
