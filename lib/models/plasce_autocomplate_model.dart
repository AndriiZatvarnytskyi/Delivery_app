class PlaceAutocomplate {
  final String description;
  final String placeId;

  PlaceAutocomplate({required this.description, required this.placeId});

  factory PlaceAutocomplate.fromJson(Map<String, dynamic> json) {
    return PlaceAutocomplate(
        description: json['description'], placeId: json['place_id']);
  }
}
