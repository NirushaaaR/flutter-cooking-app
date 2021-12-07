import 'package:cooking_app/recipe/views/recipe_detail/recipe_detail_page.dart';
import 'package:cooking_app/recipe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cooking_app/recipe/models/models.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 14, 12, 0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecipeDetailPage(),
            ),
          );
        },
        child: SizedBox(
          height: 160,
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(recipe.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    RatingText(rating: recipe.rating),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(6, 12, 6, 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Text('By ${recipe.createBy}'),
                      Row(
                        children: [
                          const Icon(
                            Icons.watch,
                            color: Color(0xFF5AC086),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("${recipe.cookingTime} Min"),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.emoji_emotions,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(recipe.difficulty),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
