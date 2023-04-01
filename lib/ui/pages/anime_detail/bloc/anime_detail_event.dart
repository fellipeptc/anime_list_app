abstract class AnimeDetailEvent {
  const AnimeDetailEvent();
}

class GetAnimeDetailEvent extends AnimeDetailEvent {
  int id;
  GetAnimeDetailEvent(this.id);
}
