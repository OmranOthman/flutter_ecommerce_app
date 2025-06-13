import 'package:json_annotation/json_annotation.dart';

part 'search_vendor_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SearchVendorModel<T> {
  final List<T> data;
  final PaginationLinks links;
  final Meta meta;

  SearchVendorModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory SearchVendorModel.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$SearchVendorModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$SearchVendorModelToJson(this, toJsonT);
}

@JsonSerializable()
class PaginationLinks {
  final String first;
  final String last;
  final String? prev;
  final String? next;

  PaginationLinks({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinksFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationLinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  final int currentPage;
  final int? from;
  @JsonKey(name: 'last_page')
  final int lastPage;
  final List<PageLink> links;
  final String path;
  @JsonKey(name: 'per_page')
  final int perPage;
  final int? to;
  final int total;

  Meta({
    required this.currentPage,
    this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) =>
      _$PageLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PageLinkToJson(this);
}