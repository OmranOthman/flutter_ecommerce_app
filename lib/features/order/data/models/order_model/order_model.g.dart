// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      statusValue: (json['status_value'] as num?)?.toInt(),
      vendorName: json['vendor_name'] as String?,
      vendorBrandImage: json['vendor_brand_image'] as String?,
      total: (json['total'] as num?)?.toInt(),
      note: json['note'] as String?,
      address: json['address'] as String?,
      fee: (json['fee'] as num?)?.toInt(),
      subtotal: (json['subtotal'] as num?)?.toInt(),
      discountTotal: (json['discount_total'] as num?)?.toInt(),
      expectedPrepTime: json['expected_prep_time'],
      paymentStatus: json['payment_status'] as String?,
      paymentMethod: json['payment_method'] as String?,
      createdAt: json['created_at'] as String?,
      orderLines: (json['order_lines'] as List<dynamic>?)
          ?.map((e) => OrderLinesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'status_value': instance.statusValue,
      'vendor_name': instance.vendorName,
      'vendor_brand_image': instance.vendorBrandImage,
      'total': instance.total,
      'note': instance.note,
      'address': instance.address,
      'fee': instance.fee,
      'subtotal': instance.subtotal,
      'discount_total': instance.discountTotal,
      'expected_prep_time': instance.expectedPrepTime,
      'payment_status': instance.paymentStatus,
      'payment_method': instance.paymentMethod,
      'created_at': instance.createdAt,
      'order_lines': instance.orderLines,
    };
