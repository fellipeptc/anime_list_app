import 'package:anime_list_app/model/anime.dart';
import 'package:dio/dio.dart';

import '../values_constant.dart';
import 'i_anime_provider.dart';

class AnimeProvider implements IAnimeProvider {
  final dio = Dio();

  @override
  Future<Anime?> getAnimeById(int id) async {
    try {
      final Response response = await dio.get('$kApiBase/$id');
      if (response.statusCode == 200) {
        return Anime.fromJson(response.data['data']);
      }
    } on DioError catch (e) {
      print('Problem return data api.');
      throw UnimplementedError(e.toString());
    }
    return null;
  }

  @override
  Future<List<Anime>?> getListAnimeByTitle(String title) async {
    try {
      final Response response = await dio.get('$kApiBase$kApiFilter$title');
      if (response.statusCode == 200) {
        final List<Anime> animeList = response.data['data']
            .map((e) => Anime.fromJson(e))
            .toList()
            .cast<Anime>();

        return animeList;
      }
    } on DioError catch (e) {
      print('Problem return list data api.');
      throw UnimplementedError(e.toString());
    }
    return null;
  }
}
