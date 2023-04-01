import 'package:anime_list_app/provider/anime_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../model/anime.dart';
import '../provider/i_anime_provider.dart';

class AnimeRepository {
  final IAnimeProvider _animeProvider = AnimeProvider();
  final Connectivity connectivity = Connectivity();

  Future<List<Anime>?> getListAnimeByTitle(String title) async {
    final result = await connectivity.checkConnectivity();

    if (result != ConnectivityResult.none) {
      return await _animeProvider.getListAnimeByTitle(title);
    }
    return null;
  }

  Future<Anime?> getAnimeById(int id) async {
    final result = await connectivity.checkConnectivity();

    if (result != ConnectivityResult.none) {
      return await _animeProvider.getAnimeById(id);
    }
    return null;
  }
}
