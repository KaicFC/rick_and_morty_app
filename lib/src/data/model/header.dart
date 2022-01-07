class HeaderModel {
  final List? results;

  HeaderModel({
    required this.results,
  });

  static HeaderModel fromJson(Map<String, dynamic> json) {
    return HeaderModel(
      results: json['results'],
    );
  }
}
