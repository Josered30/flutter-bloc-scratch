import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_scratch/bloc/animes_bloc.dart';
import 'package:flutter_bloc_pattern_scratch/bloc/generic_bloc_provider.dart';
import 'package:flutter_bloc_pattern_scratch/models/anime.dart';


class AnimeList extends StatelessWidget {
  
  AnimeBloc animeBloc;

  @override
  Widget build(BuildContext context) {
    animeBloc = BlocProvider.of(context);

    return Container(
      child: StreamBuilder<Object>(
        initialData:  List<Anime>(),
        stream: animeBloc.animeList ,
        builder: (context, snapshot) {
          List<Anime> animeList = snapshot.data;
          return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      child: Card(
                        color: Colors.grey[900],
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/details',
                                arguments: {'anime': animeList[index]});
                          },
                          title: Text(
                            animeList[index].name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 0),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(),
                              child: Image.network(animeList[index].imageUrl,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: animeList.length,
                );
        }
      ),
    );
  }
}