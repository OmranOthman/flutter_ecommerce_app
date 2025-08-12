part of 'review_cubit.dart';

class ReviewState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<ReviewEntity> reviews;

  const ReviewState({
    required this.isLoading,
    this.errorMessage,
    required this.reviews,
  });

  factory ReviewState.init() {
    return const ReviewState(
      isLoading: false,
      errorMessage: null,
      reviews: [],
    );
  }

  ReviewState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ReviewEntity>? reviews,
  }) {
    return ReviewState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, reviews];
}
