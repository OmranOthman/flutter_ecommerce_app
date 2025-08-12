class SearchProductModel {
  int? id;
  String? name;
  String? media;
  int? price;

  SearchProductModel({
    this.id,
    this.media,
    this.name,
    this.price,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
        id: (json['id'] as num?)?.toInt(),
        name: json['name'] as String?,
        media: json['media'],
        price: json['price'],
      );
}
