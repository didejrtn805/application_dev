class PostModel {
  final String postId;
  final String authorId;
  final String anonymousId;
  final String category;
  final String title;
  final String content;
  final List<String> images;
  final int likes;
  final int comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isReported;
  final int reportCount;

  PostModel({
    required this.postId,
    required this.authorId,
    required this.anonymousId,
    required this.category,
    required this.title,
    required this.content,
    required this.images,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.isReported,
    required this.reportCount,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postId: map['postId'] ?? '',
      authorId: map['authorId'] ?? '',
      anonymousId: map['anonymousId'] ?? '',
      category: map['category'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      images: (map['images'] as List<dynamic>?)?.cast<String>() ?? [],
      likes: map['likes'] ?? 0,
      comments: map['comments'] ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] ?? 0),
      isReported: map['isReported'] ?? false,
      reportCount: map['reportCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'authorId': authorId,
      'anonymousId': anonymousId,
      'category': category,
      'title': title,
      'content': content,
      'images': images,
      'likes': likes,
      'comments': comments,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'isReported': isReported,
      'reportCount': reportCount,
    };
  }
}

class CommentModel {
  final String commentId;
  final String postId;
  final String authorId;
  final String anonymousId;
  final String content;
  final DateTime createdAt;
  final bool isReported;

  CommentModel({
    required this.commentId,
    required this.postId,
    required this.authorId,
    required this.anonymousId,
    required this.content,
    required this.createdAt,
    required this.isReported,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentId: map['commentId'] ?? '',
      postId: map['postId'] ?? '',
      authorId: map['authorId'] ?? '',
      anonymousId: map['anonymousId'] ?? '',
      content: map['content'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      isReported: map['isReported'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commentId': commentId,
      'postId': postId,
      'authorId': authorId,
      'anonymousId': anonymousId,
      'content': content,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isReported': isReported,
    };
  }
}

enum PostCategory {
  relationship('연애고민'),
  daily('일상이야기'),
  hobby('취미/관심사'),
  meeting('만남/모임'),
  question('질문/답변');

  const PostCategory(this.displayName);
  final String displayName;
}
