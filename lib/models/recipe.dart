class Recipe{
  final String name;
  final double rating;
  final String img;
  const Recipe({
    required this.name,
    required this.rating,
    required this.img,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      img: json['image'].toString(),
    );
  }
}