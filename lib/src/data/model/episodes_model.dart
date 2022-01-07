class EpisodesModel {
  final int? id;
  final String? name;
  final String? air_date;
  final String? episode;
  final List? characters;
  final String? url;
  final String? created;

  EpisodesModel({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  static EpisodesModel fromJson(Map<String, dynamic> json) {
    return EpisodesModel(
      id: json['id'],
      name: json['name'],
      air_date: json['air_date'],
      episode: json['episode'],
      characters: json['characters'],
      url: json['url'],
      created: json['created'],
    );
  }
}
