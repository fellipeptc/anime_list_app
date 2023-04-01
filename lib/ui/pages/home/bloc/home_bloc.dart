import 'package:anime_list_app/repository/anime_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/anime.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AnimeRepository _animeRepository = AnimeRepository();

  HomeBloc(HomeLoadingState homeLoadingState) : super(HomeLoadingState()) {
    on<InitialListEvent>(
      (event, emit) async {
        try {
          final animeList =
              await _animeRepository.getListAnimeByTitle(event.initialTitle);
          emit(HomeLoadedState(animeList ?? <Anime>[]));
        } on DioError {
          emit(HomeErrorState(message: 'Falha ao carregar as informações'));
        }
      },
    );

    on<GetAnimeListEvent>(
      (event, emit) async {
        try {
          emit(HomeLoadingState());
          final animeList =
              await _animeRepository.getListAnimeByTitle(event.title);
          emit(HomeLoadedState(animeList ?? <Anime>[]));
        } on DioError {
          emit(HomeErrorState(message: 'Falha ao carregar as informações'));
        }
      },
    );
  }
}
