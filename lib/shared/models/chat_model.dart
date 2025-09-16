class ChatRoomModel {
  final String chatRoomId;
  final List<String> participants;
  final String lastMessage;
  final DateTime lastMessageAt;
  final int unreadCount;
  final DateTime createdAt;
  final bool isActive;

  ChatRoomModel({
    required this.chatRoomId,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageAt,
    required this.unreadCount,
    required this.createdAt,
    required this.isActive,
  });

  factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomModel(
      chatRoomId: map['chatRoomId'] ?? '',
      participants: (map['participants'] as List<dynamic>?)
          ?.cast<String>() ?? [],
      lastMessage: map['lastMessage'] ?? '',
      lastMessageAt: DateTime.fromMillisecondsSinceEpoch(map['lastMessageAt'] ?? 0),
      unreadCount: map['unreadCount'] ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      isActive: map['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatRoomId': chatRoomId,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageAt': lastMessageAt.millisecondsSinceEpoch,
      'unreadCount': unreadCount,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isActive': isActive,
    };
  }
}

class ChatMessageModel {
  final String messageId;
  final String chatRoomId;
  final String senderId;
  final String content;
  final MessageType type;
  final DateTime createdAt;
  final bool isRead;
  final String? imageUrl;

  ChatMessageModel({
    required this.messageId,
    required this.chatRoomId,
    required this.senderId,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.isRead,
    this.imageUrl,
  });

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      messageId: map['messageId'] ?? '',
      chatRoomId: map['chatRoomId'] ?? '',
      senderId: map['senderId'] ?? '',
      content: map['content'] ?? '',
      type: MessageType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => MessageType.text,
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      isRead: map['isRead'] ?? false,
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'chatRoomId': chatRoomId,
      'senderId': senderId,
      'content': content,
      'type': type.name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isRead': isRead,
      'imageUrl': imageUrl,
    };
  }
}

enum MessageType {
  text('텍스트'),
  image('이미지'),
  system('시스템');

  const MessageType(this.displayName);
  final String displayName;
}
