class Post {
  final String description;
  final String imagePath;
  final DateTime date;

  Post({
    required this.description,
    required this.imagePath,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'imagePath': imagePath,
      'date': date.toIso8601String(),
    };
  }

  static Post fromJson(Map<String, dynamic> json) {
    return Post(
      description: json['description'],
      imagePath: json['imagePath'],
      date: DateTime.parse(json['date']),
    );
  }
}
