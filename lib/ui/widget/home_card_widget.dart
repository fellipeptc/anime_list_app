import 'package:anime_list_app/ui/pages/anime_detail/anime_detail_page.dart';
import 'package:anime_list_app/ui/pages/anime_detail/bloc/anime_detail_bloc.dart';
import 'package:anime_list_app/ui/pages/anime_detail/bloc/anime_detail_event.dart';
import 'package:anime_list_app/ui/pages/anime_detail/bloc/anime_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/anime.dart';

class HomeCard extends StatelessWidget {
  final Anime anime;

  const HomeCard({
    required this.anime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AnimeDetailBloc(AnimeDetailLoadingState())
                ..add(GetAnimeDetailEvent(anime.id)),
              child: AnimeDetailPage(id: anime.id),
            ),
          ),
        );
      },
      child: Container(
        height: 554,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.network(
                anime.posterMedium,
                fit: BoxFit.cover,
              ),
              Container(
                color: const Color.fromARGB(20, 255, 255, 255),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 56, 6, 65),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: _buildStarRating(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: _buildTypeAnime(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amberAccent,
            size: 30,
          ),
          const SizedBox(width: 5),
          Text(
            anime.averageRating != null ? '${anime.averageRating}' : 'S/N',
            style: const TextStyle(
              color: Colors.amberAccent,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeAnime() {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 85,
      height: 35,
      decoration: BoxDecoration(
        color: const Color.fromARGB(199, 56, 6, 65),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          anime.type.name.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
