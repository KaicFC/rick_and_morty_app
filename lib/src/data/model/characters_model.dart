import 'package:rick_and_morty_app/src/data/model/locations_model.dart';

class CharactersModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final LocationsModel? origin;
  final LocationsModel? location;
  final String? image;
  final List? episode;
  final String? url;
  final String? created;

  CharactersModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  static CharactersModel fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      id: json['id'],
      name: json["name"],
      status: json["status"],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: LocationsModel.fromJson(json['origin']),
      location: LocationsModel.fromJson(json['location']),
      image: json['image'],
      episode: json['episode'],
      url: json['url'],
      created: json['created'],
    );
  }
}
