import 'package:anime_list_app/ui/pages/anime_detail/bloc/anime_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../values_constant.dart';
import '../../widget/my_loader_widget.dart';
import 'bloc/anime_detail_bloc.dart';
import 'package:intl/intl.dart';

class AnimeDetailPage extends StatelessWidget {
  final int id;

  const AnimeDetailPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AnimeDetailBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is AnimeDetailLoadedState) {
            final anime = state.anime;
            if (anime != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: borderOnlyBottom,
                      child: Stack(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: borderOnlyBottom,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                              child: Image.network(
                                anime.posterMedium,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            height: 300,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(64, 24, 4, 27),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_circle_left_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 5),
                              decoration: borderOnlyBottom
                                  .cl(const Color.fromARGB(199, 56, 6, 65))
                                  .grad,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                    size: 30,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    anime.averageRating != null
                                        ? '${anime.averageRating}'
                                        : 'S/N',
                                    style: const TextStyle(
                                      color: Colors.amberAccent,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        anime.title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: kPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 22,
                          color: kPurple,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(8),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          anime.description.isNotEmpty
                              ? anime.description
                              : 'no description for this anime.',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Popular Rating: ${anime.popularityRank}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: kPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Start Date: ${DateFormat('dd-MM-yyyy').format(anime.startDate)}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: kPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Episodes: ${anime.episodeCount ?? 'S/N'}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: kPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        'Status: ${anime.type.name.toUpperCase()} / ${anime.status.name.toUpperCase()}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: kPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.cloud_off_rounded,
                    color: Colors.redAccent,
                    size: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Error fetching anime from internet, please try again.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              );
            }
          }
          return const MyLoader(space: 100);
        },
      ),
    );
  }
}
