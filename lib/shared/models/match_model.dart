class MatchModel {
  final String matchId;
  final String user1Id;
  final String user2Id;
  final MatchType type;
  final MatchStatus status;
  final DateTime createdAt;
  final DateTime? matchedAt;
  final String? chatRoomId;

  MatchModel({
    required this.matchId,
    required this.user1Id,
    required this.user2Id,
    required this.type,
    required this.status,
    required this.createdAt,
    this.matchedAt,
    this.chatRoomId,
  });

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    return MatchModel(
      matchId: map['matchId'] ?? '',
      user1Id: map['user1Id'] ?? '',
      user2Id: map['user2Id'] ?? '',
      type: MatchType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => MatchType.daily,
      ),
      status: MatchStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => MatchStatus.pending,
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      matchedAt: map['matchedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['matchedAt'])
          : null,
      chatRoomId: map['chatRoomId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'matchId': matchId,
      'user1Id': user1Id,
      'user2Id': user2Id,
      'type': type.name,
      'status': status.name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'matchedAt': matchedAt?.millisecondsSinceEpoch,
      'chatRoomId': chatRoomId,
    };
  }
}

enum MatchType {
  daily('데일리 매칭'),
  board('게시판 매칭'),
  interest('관심 표현');

  const MatchType(this.displayName);
  final String displayName;
}

enum MatchStatus {
  pending('대기중'),
  matched('매칭됨'),
  expired('만료됨'),
  rejected('거절됨');

  const MatchStatus(this.displayName);
  final String displayName;
}

class DailyMatchModel {
  final String matchId;
  final String userId;
  final List<String> recommendedUserIds;
  final DateTime createdAt;
  final DateTime expiresAt;
  final bool isUsed;

  DailyMatchModel({
    required this.matchId,
    required this.userId,
    required this.recommendedUserIds,
    required this.createdAt,
    required this.expiresAt,
    required this.isUsed,
  });

  factory DailyMatchModel.fromMap(Map<String, dynamic> map) {
    return DailyMatchModel(
      matchId: map['matchId'] ?? '',
      userId: map['userId'] ?? '',
      recommendedUserIds: (map['recommendedUserIds'] as List<dynamic>?)
          ?.cast<String>() ?? [],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      expiresAt: DateTime.fromMillisecondsSinceEpoch(map['expiresAt'] ?? 0),
      isUsed: map['isUsed'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'matchId': matchId,
      'userId': userId,
      'recommendedUserIds': recommendedUserIds,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'expiresAt': expiresAt.millisecondsSinceEpoch,
      'isUsed': isUsed,
    };
  }
}

class InterestModel {
  final String interestId;
  final String fromUserId;
  final String toUserId;
  final String postId;
  final InterestStatus status;
  final DateTime createdAt;
  final DateTime? respondedAt;

  InterestModel({
    required this.interestId,
    required this.fromUserId,
    required this.toUserId,
    required this.postId,
    required this.status,
    required this.createdAt,
    this.respondedAt,
  });

  factory InterestModel.fromMap(Map<String, dynamic> map) {
    return InterestModel(
      interestId: map['interestId'] ?? '',
      fromUserId: map['fromUserId'] ?? '',
      toUserId: map['toUserId'] ?? '',
      postId: map['postId'] ?? '',
      status: InterestStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => InterestStatus.pending,
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      respondedAt: map['respondedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['respondedAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'interestId': interestId,
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'postId': postId,
      'status': status.name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'respondedAt': respondedAt?.millisecondsSinceEpoch,
    };
  }
}

enum InterestStatus {
  pending('대기중'),
  accepted('수락됨'),
  rejected('거절됨'),
  expired('만료됨');

  const InterestStatus(this.displayName);
  final String displayName;
}
