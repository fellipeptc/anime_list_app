enum StatusType {
  current,
  finished,
  tba,
  unreleased,
  upcoming,
}

enum Type {
  ona,
  ova,
  tv,
  movie,
  music,
  special,
}

class Anime {
  late int id;
  late Type type;
  late String link;
  late DateTime startDate;
  late String title;
  late String description;
  late double? averageRating;
  late int? popularityRank;
  late StatusType status;
  late String posterTiny;
  late String posterLarge;
  late String posterMedium;
  late int? episodeCount;

  Anime({
    required this.id,
    required this.type,
    required this.link,
    required this.startDate,
    required this.title,
    required this.description,
    required this.averageRating,
    required this.popularityRank,
    required this.status,
    required this.posterTiny,
    required this.posterLarge,
    required this.posterMedium,
    required this.episodeCount,
  });

  Anime.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']) ?? 0;
    type = Type.values.firstWhere(
        (t) => t.name == json['attributes']['subtype'].toLowerCase());
    link = json['links']['self'];
    startDate = DateTime.parse(json['attributes']['startDate']);
    title = json['attributes']['titles']['en_jp'] ??
        json['attributes']['titles']['en'] ??
        json['attributes']['titles']['en_us'];
    description = json['attributes']['description'];
    averageRating = json['attributes']['averageRating'] == null
        ? null
        : double.tryParse(json['attributes']['averageRating']) ?? 0;
    popularityRank = json['attributes']['popularityRank'];
    status = StatusType.values.firstWhere(
        (s) => s.name == json['attributes']['status'].toLowerCase());
    posterTiny = json['attributes']['posterImage']['tiny'];
    posterLarge = json['attributes']['posterImage']['large'];
    posterMedium = json['attributes']['posterImage']['medium'];
    episodeCount = json['attributes']['episodeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['type'] = type.name;
    data['link'] = link;
    data['startDate'] = startDate;
    data['title'] = title;
    data['description'] = description;
    data['averageRating'] = averageRating;
    data['popularityRank'] = popularityRank;
    data['status'] = status.name;
    data['posterTinny'] = posterTiny;
    data['posterLarge'] = posterLarge;
    data['posterMedium'] = posterMedium;
    data['episodeCount'] = episodeCount;
    return data;
  }
}
