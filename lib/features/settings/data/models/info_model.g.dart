// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      data: InfoData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'data': instance.data.toJson(),
    };

InfoData _$InfoDataFromJson(Map<String, dynamic> json) => InfoData(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      facebook: json['facebook'] as String,
      instagram: json['instagram'] as String,
      twitter: json['twitter'] as String,
      linkedin: json['linkedin'] as String,
      youtube: json['youtube'] as String,
      terms: Terms.fromJson(json['terms'] as Map<String, dynamic>),
      splash: Splash.fromJson(json['splash'] as Map<String, dynamic>),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$InfoDataToJson(InfoData instance) => <String, dynamic>{
      'location': instance.location,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
      'youtube': instance.youtube,
      'terms': instance.terms,
      'splash': instance.splash,
      'currency': instance.currency,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) => Terms(
      en: json['en'] as String,
      ar: json['ar'] as String,
    );

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

Splash _$SplashFromJson(Map<String, dynamic> json) => Splash(
      id: (json['id'] as num).toInt(),
      adId: (json['ad_id'] as num).toInt(),
      adType: json['ad_type'] as String,
      vendorId: (json['vendor_id'] as num?)?.toInt(),
      url: json['url'] as String?,
      collectionShowType: json['collection_show_type'] as String?,
      categoryShowType: json['category_show_type'] as String?,
      media: json['media'] as String,
    );

Map<String, dynamic> _$SplashToJson(Splash instance) => <String, dynamic>{
      'id': instance.id,
      'ad_id': instance.adId,
      'ad_type': instance.adType,
      'vendor_id': instance.vendorId,
      'url': instance.url,
      'collection_show_type': instance.collectionShowType,
      'category_show_type': instance.categoryShowType,
      'media': instance.media,
    };
