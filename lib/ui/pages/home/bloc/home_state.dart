import '../../../../model/anime.dart';

/// Gera os estados utilizados pelo HomeBloc
/// Carregando, Carregado, Erro

abstract class HomeState {
  const HomeState();
}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  List<Anime> animeList;
  HomeLoadedState(this.animeList);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState({required this.message});
}
