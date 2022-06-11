class SocialModel {
  final String socialName;
  final String sociallink;
  final String socialIcon;
  final String? socialColors;

  SocialModel({
    required this.socialName,
    required this.sociallink,
    required this.socialIcon,
    this.socialColors,
  });

  factory SocialModel.fromJson(Map<String, dynamic> json) {
    return SocialModel(
      socialName: json['socialName'],
      sociallink: json['sociallink'],
      socialIcon: json['socialIcon'],
      socialColors: json['socialColors'],
    );
  }
}
