/// Evento processado pelo Home Bloc
abstract class HomeEvent {
  const HomeEvent();
}

class InitialListEvent extends HomeEvent {
  String get initialTitle => 'Naruto';
}

class GetAnimeListEvent extends HomeEvent {
  String title;
  GetAnimeListEvent(this.title);
}
