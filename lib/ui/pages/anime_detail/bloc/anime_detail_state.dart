import '../../../../model/anime.dart';

abstract class AnimeDetailState {
  const AnimeDetailState();
}

class AnimeDetailLoadingState extends AnimeDetailState {}

class AnimeDetailLoadedState extends AnimeDetailState {
  Anime? anime;
  AnimeDetailLoadedState(this.anime);
}

class AnimeDetailErrorState extends AnimeDetailState {
  final String message;
  AnimeDetailErrorState({required this.message});
}
