class ReviewEntity {
  final int id;
  final int rating;
  final String review;
  final String createdAt;
  final String customerName;

  ReviewEntity({
    required this.id,
    required this.rating,
    required this.review,
    required this.createdAt,
    required this.customerName,
  });
}
