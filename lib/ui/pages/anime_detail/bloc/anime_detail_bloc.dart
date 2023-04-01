import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repository/anime_repository.dart';
import 'anime_detail_event.dart';
import 'anime_detail_state.dart';

class AnimeDetailBloc extends Bloc<AnimeDetailEvent, AnimeDetailState> {
  final AnimeRepository _animeRepository = AnimeRepository();

  AnimeDetailBloc(AnimeDetailLoadingState animeDetailLoadingState)
      : super(AnimeDetailLoadingState()) {
    on<GetAnimeDetailEvent>(
      (event, emit) async {
        try {
          final anime = await _animeRepository.getAnimeById(event.id);
          emit(AnimeDetailLoadedState(anime));
        } on DioError {
          emit(
            AnimeDetailErrorState(message: 'Falha ao carregar as informações'),
          );
        }
      },
    );
  }
}
