import 'package:json_annotation/json_annotation.dart';
part 'raw_review.g.dart';

@JsonSerializable()
class RawReview {
  RawReview(
      {required this.rating,
      required this.comment,
      required this.date,
      required this.reviewerName,
      required this.reviewerEmail});
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Map<String, dynamic> toJson() => _$RawReviewToJson(this);

  factory RawReview.fromJson(Map<String, dynamic> json) =>
      _$RawReviewFromJson(json);
}
