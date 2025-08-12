import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/features/settings/data/models/info_model.dart';

abstract class AppSettingsState extends Equatable {
  const AppSettingsState();

  @override
  List<Object?> get props => [];
}

class AppSettingsInitial extends AppSettingsState {}

class AppSettingsLoading extends AppSettingsState {}

class AppSettingsLoaded extends AppSettingsState {
  final InfoModel infoModel;

  const AppSettingsLoaded(this.infoModel);

  @override
  List<Object?> get props => [infoModel];
}

class AppSettingsError extends AppSettingsState {
  final String message;

  const AppSettingsError(this.message);

  @override
  List<Object?> get props => [message];
}
