class UserModel {
  final String userId;
  final String phoneNumber;
  final UserProfile profile;
  final UserPreferences preferences;
  final MatchingSettings matchingSettings;
  final UserStatus status;
  final UserSubscription subscription;

  UserModel({
    required this.userId,
    required this.phoneNumber,
    required this.profile,
    required this.preferences,
    required this.matchingSettings,
    required this.status,
    required this.subscription,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profile: UserProfile.fromMap(map['profile'] ?? {}),
      preferences: UserPreferences.fromMap(map['preferences'] ?? {}),
      matchingSettings: MatchingSettings.fromMap(map['matchingSettings'] ?? {}),
      status: UserStatus.fromMap(map['status'] ?? {}),
      subscription: UserSubscription.fromMap(map['subscription'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'phoneNumber': phoneNumber,
      'profile': profile.toMap(),
      'preferences': preferences.toMap(),
      'matchingSettings': matchingSettings.toMap(),
      'status': status.toMap(),
      'subscription': subscription.toMap(),
    };
  }
}

class UserProfile {
  final String nickname;
  final String gender;
  final String birthDate;
  final List<Photo> photos;
  final String job;
  final Location location;
  final int height;
  final String education;
  final String religion;

  UserProfile({
    required this.nickname,
    required this.gender,
    required this.birthDate,
    required this.photos,
    required this.job,
    required this.location,
    required this.height,
    required this.education,
    required this.religion,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      nickname: map['nickname'] ?? '',
      gender: map['gender'] ?? '',
      birthDate: map['birthDate'] ?? '',
      photos: (map['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromMap(e))
          .toList() ?? [],
      job: map['job'] ?? '',
      location: Location.fromMap(map['location'] ?? {}),
      height: map['height'] ?? 0,
      education: map['education'] ?? '',
      religion: map['religion'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'gender': gender,
      'birthDate': birthDate,
      'photos': photos.map((e) => e.toMap()).toList(),
      'job': job,
      'location': location.toMap(),
      'height': height,
      'education': education,
      'religion': religion,
    };
  }
}

class Photo {
  final String url;
  final int order;
  final bool isMain;

  Photo({
    required this.url,
    required this.order,
    required this.isMain,
  });

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      url: map['url'] ?? '',
      order: map['order'] ?? 0,
      isMain: map['isMain'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'order': order,
      'isMain': isMain,
    };
  }
}

class Location {
  final String city;
  final String district;
  final Coordinates coordinates;

  Location({
    required this.city,
    required this.district,
    required this.coordinates,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      city: map['city'] ?? '',
      district: map['district'] ?? '',
      coordinates: Coordinates.fromMap(map['coordinates'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'district': district,
      'coordinates': coordinates.toMap(),
    };
  }
}

class Coordinates {
  final double lat;
  final double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      lat: (map['lat'] ?? 0.0).toDouble(),
      lng: (map['lng'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class UserPreferences {
  final AgeRange ageRange;
  final int locationRadius;
  final String purpose;

  UserPreferences({
    required this.ageRange,
    required this.locationRadius,
    required this.purpose,
  });

  factory UserPreferences.fromMap(Map<String, dynamic> map) {
    return UserPreferences(
      ageRange: AgeRange.fromMap(map['ageRange'] ?? {}),
      locationRadius: map['locationRadius'] ?? 20,
      purpose: map['purpose'] ?? 'relationship',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ageRange': ageRange.toMap(),
      'locationRadius': locationRadius,
      'purpose': purpose,
    };
  }
}

class AgeRange {
  final int min;
  final int max;

  AgeRange({
    required this.min,
    required this.max,
  });

  factory AgeRange.fromMap(Map<String, dynamic> map) {
    return AgeRange(
      min: map['min'] ?? 20,
      max: map['max'] ?? 35,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'min': min,
      'max': max,
    };
  }
}

class MatchingSettings {
  final bool dailyMatchingEnabled;
  final String mode;

  MatchingSettings({
    required this.dailyMatchingEnabled,
    required this.mode,
  });

  factory MatchingSettings.fromMap(Map<String, dynamic> map) {
    return MatchingSettings(
      dailyMatchingEnabled: map['dailyMatchingEnabled'] ?? true,
      mode: map['mode'] ?? 'anonymous',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dailyMatchingEnabled': dailyMatchingEnabled,
      'mode': mode,
    };
  }
}

class UserStatus {
  final bool isApproved;
  final String approvalStatus;
  final String rejectionReason;
  final DateTime createdAt;
  final DateTime? approvedAt;

  UserStatus({
    required this.isApproved,
    required this.approvalStatus,
    required this.rejectionReason,
    required this.createdAt,
    this.approvedAt,
  });

  factory UserStatus.fromMap(Map<String, dynamic> map) {
    return UserStatus(
      isApproved: map['isApproved'] ?? false,
      approvalStatus: map['approvalStatus'] ?? 'pending',
      rejectionReason: map['rejectionReason'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      approvedAt: map['approvedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['approvedAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isApproved': isApproved,
      'approvalStatus': approvalStatus,
      'rejectionReason': rejectionReason,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'approvedAt': approvedAt?.millisecondsSinceEpoch,
    };
  }
}

class UserSubscription {
  final String type;
  final DateTime? expiresAt;

  UserSubscription({
    required this.type,
    this.expiresAt,
  });

  factory UserSubscription.fromMap(Map<String, dynamic> map) {
    return UserSubscription(
      type: map['type'] ?? 'free',
      expiresAt: map['expiresAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['expiresAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'expiresAt': expiresAt?.millisecondsSinceEpoch,
    };
  }
}
