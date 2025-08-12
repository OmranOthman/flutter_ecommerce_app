import 'package:json_annotation/json_annotation.dart';

part 'states_model.g.dart';

@JsonSerializable()
class StatesModel {
  final List<StateData> data;

  StatesModel({required this.data});

  factory StatesModel.fromJson(Map<String, dynamic> json) =>
      _$StatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatesModelToJson(this);
}

@JsonSerializable()
class StateData {
  final int id;
  final String name;

  StateData({required this.id, required this.name});

  factory StateData.fromJson(Map<String, dynamic> json) =>
      _$StateDataFromJson(json);

  Map<String, dynamic> toJson() => _$StateDataToJson(this);
}