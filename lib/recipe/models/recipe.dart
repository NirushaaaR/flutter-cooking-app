class Recipe {
  final String imageUrl;
  final String title;
  final int cookingTime;
  final double rating;
  final String difficulty;
  final String createBy;

  const Recipe({
    required this.imageUrl,
    required this.title,
    required this.cookingTime,
    required this.rating,
    required this.difficulty,
    required this.createBy,
  });
}
