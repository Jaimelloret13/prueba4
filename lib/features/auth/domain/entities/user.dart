class User {
  String email;
  String name;
  String nickname;
  String emergencyNumber;
  List<String> followers;
  List<String> following;
  List<String> badges;
  Map<String, dynamic> statistics;

  User({
    required this.email,
    required this.name,
    required this.nickname,
    required this.emergencyNumber,
    required this.followers,
    required this.following,
    required this.badges,
    required this.statistics,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      nickname: json['nickname'],
      emergencyNumber: json['emergencyNumber'],
      followers: List<String>.from(json['followers']),
      following: List<String>.from(json['following']),
      badges: List<String>.from(json['badges']),
      statistics: Map<String, dynamic>.from(json['statistics']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'nickname': nickname,
      'emergencyNumber': emergencyNumber,
      'followers': followers,
      'following': following,
      'badges': badges,
      'statistics': statistics,
    };
  }

  void updateProfile({
    required String newEmail,
    required String newName,
    required String newNickname,
    required String newEmergencyNumber,
  }) {
    email = newEmail;
    name = newName;
    nickname = newNickname;
    emergencyNumber = newEmergencyNumber;
  }

  void addExperience(int points) {
    if (statistics.containsKey('XP')) {
      statistics['XP'] += points;
    } else {
      statistics['XP'] = points;
    }
  }
}
