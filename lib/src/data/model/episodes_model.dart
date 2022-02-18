class EpisodesModel {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List? characters;
  final String? url;
  final String? created;

  EpisodesModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  static EpisodesModel fromJson(Map<String, dynamic> json) {
    return EpisodesModel(
      id: json['id'],
      name: json['name'],
      airDate: json['airDate'],
      episode: json['episode'],
      characters: json['characters'],
      url: json['url'],
      created: json['created'],
    );
  }
}
