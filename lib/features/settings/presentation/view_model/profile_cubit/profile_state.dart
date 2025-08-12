part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final bool isLoading;
  final bool editLoading;
  final bool changePasswordLoading;
  final bool changePasswordSuccess;
  final String? changePasswordErrorMessage;
  final String? errorMessageEdit;
  final String? errorMessage;
  final ProfileEntity? profileEntity;
  final bool editSuccess;
  final String? currentPassword;
  final String? newPassword;
  final String? passwordConfirmation;

  const ProfileState({
    this.isLoading = false,
    this.editLoading = false,
    this.errorMessage,
    this.profileEntity,
    this.errorMessageEdit,
    this.editSuccess = false,
    this.changePasswordLoading = false,
    this.changePasswordSuccess = false,
    this.changePasswordErrorMessage,
    this.currentPassword,
    this.newPassword,
    this.passwordConfirmation,
  });

  factory ProfileState.init() => ProfileState(
        isLoading: false,
        editLoading: false,
        editSuccess: false,
        changePasswordLoading: false,
        changePasswordSuccess: false,
        profileEntity: ProfileEntity(),
      );

  ProfileState copyWith({
    bool? isLoading,
    bool? editLoading,
    bool? editSuccess,
    String? errorMessage,
    String? errorMessageEdit,
    ProfileEntity? profileEntity,
    bool? changePasswordLoading,
    bool? changePasswordSuccess,
    String? changePasswordErrorMessage,
    String? currentPassword,
    String? newPassword,
    String? passwordConfirmation,
  }) =>
      ProfileState(
          isLoading: isLoading ?? this.isLoading,
          profileEntity: profileEntity ?? this.profileEntity,
          editLoading: editLoading ?? this.editLoading,
          errorMessage: errorMessage,
          errorMessageEdit: errorMessageEdit,
          editSuccess: editSuccess ?? false,
          changePasswordLoading:
              changePasswordLoading ?? this.changePasswordLoading,
          changePasswordSuccess: changePasswordSuccess ?? false,
          changePasswordErrorMessage: changePasswordErrorMessage,
          currentPassword: currentPassword ?? this.currentPassword,
          newPassword: newPassword ?? this.newPassword,
          passwordConfirmation:
              passwordConfirmation ?? this.passwordConfirmation);

  @override
  List<Object?> get props => [
        profileEntity,
        editLoading,
        isLoading,
        errorMessage,
        errorMessageEdit,
        editSuccess,
        changePasswordLoading,
        changePasswordSuccess,
        changePasswordErrorMessage,
        passwordConfirmation,
        newPassword,
        currentPassword
      ];
}
