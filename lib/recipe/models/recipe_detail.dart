import 'package:cooking_app/recipe/models/models.dart';

class RecipeDetail extends Recipe {
  final List<String> ingrediants;
  final List<String> directions;

  const RecipeDetail({
    imageUrl,
    title,
    cookingTime,
    rating,
    difficulty,
    createBy,
    required this.ingrediants,
    required this.directions,
  }) : super(
          imageUrl: imageUrl,
          title: title,
          cookingTime: cookingTime,
          rating: rating,
          difficulty: difficulty,
          createBy: createBy,
        );
}
