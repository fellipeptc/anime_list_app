import '../model/anime.dart';

abstract class IAnimeProvider{
  Future<List<Anime>?> getListAnimeByTitle(String title);
  Future<Anime?> getAnimeById(int id);
}