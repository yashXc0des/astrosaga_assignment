import 'package:hive/hive.dart';

part 'astrologer_model.g.dart';

@HiveType(typeId: 0)
class AstrologerModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String profileImage;

  @HiveField(3)
  final bool isOnline;

  @HiveField(4)
  final double rating;

  @HiveField(5)
  final int experience;

  @HiveField(6)
  final int followers;

  @HiveField(7)
  final String totalCallTime;

  @HiveField(8)
  final String totalChatTime;

  @HiveField(9)
  final String profileSummary;

  @HiveField(10)
  final String specialization;

  @HiveField(11)
  final String languages;

  @HiveField(12)
  final List<String> images;

  @HiveField(13)
  final String callRate;

  @HiveField(14)
  final String originalRate;

  AstrologerModel({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.isOnline,
    required this.rating,
    required this.experience,
    required this.followers,
    required this.totalCallTime,
    required this.totalChatTime,
    required this.profileSummary,
    required this.specialization,
    required this.languages,
    required this.images,
    required this.callRate,
    required this.originalRate,
  });
}

