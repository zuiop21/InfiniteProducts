// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawReview _$RawReviewFromJson(Map<String, dynamic> json) => RawReview(
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      date: DateTime.parse(json['date'] as String),
      reviewerName: json['reviewerName'] as String,
      reviewerEmail: json['reviewerEmail'] as String,
    );

Map<String, dynamic> _$RawReviewToJson(RawReview instance) => <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };
