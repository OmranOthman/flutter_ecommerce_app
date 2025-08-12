import 'package:equatable/equatable.dart';

class FavoriteItemEntity extends Equatable {
  final int? id;
  final String? name;
  final String? media;
  final bool? isFavorite;
  final int? vendorId;

  const FavoriteItemEntity({
    this.id,
    this.isFavorite,
    this.media,
    this.name,
    this.vendorId,
  });

  FavoriteItemEntity copyWith({
    int? id,
    String? name,
    String? media,
    bool? isFavorite,
    int? vendorId,
  }) {
    return FavoriteItemEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      media: media ?? this.media,
      isFavorite: isFavorite ?? this.isFavorite,
      vendorId: vendorId ?? this.vendorId,
    );
  }

  @override
  List<Object?> get props => [
        isFavorite,
        id,
        name,
        media,
        vendorId,
      ];
}
