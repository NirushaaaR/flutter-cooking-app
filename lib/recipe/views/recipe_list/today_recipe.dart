import 'package:cooking_app/recipe/models/recipe.dart';
import 'package:cooking_app/recipe/views/recipe_detail/recipe_detail_page.dart';
import 'package:cooking_app/recipe/widgets/widgets.dart';
import 'package:flutter/material.dart';

const List<Recipe> recipes = [
  Recipe(
    imageUrl:
        "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/butter-chicken-cf6f9e2.jpg",
    title: 'Easy butter chicken',
    cookingTime: 50,
    rating: 4.8,
    difficulty: 'Easy',
    createBy: 'Jennifer Joyce',
  ),
  Recipe(
    imageUrl:
        "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic-lasange-4a66137.jpg",
    title: 'Easy classic lasagne',
    cookingTime: 15,
    rating: 4.4,
    difficulty: 'Easy',
    createBy: 'Angela Boggiano',
  ),
  Recipe(
    imageUrl:
        "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/thai-aea8468.jpg",
    title: 'Fried prawn & Pineapple rice',
    cookingTime: 25,
    rating: 5,
    difficulty: 'Easy',
    createBy: 'Good Food team',
  ),
  Recipe(
    imageUrl:
        "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sausage-leek-mash-pie-07a67d4.jpg",
    title: 'Sausage & leek mash pie',
    cookingTime: 45,
    rating: 5,
    difficulty: 'Easy',
    createBy: 'Esther Clark',
  ),
];

class TodayRecipe extends StatelessWidget {
  const TodayRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Today recipe',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: recipes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _TodayRecipeCard(
                recipe: recipes[index],
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _TodayRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const _TodayRecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.38,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(recipe.imageUrl),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            padding: const EdgeInsets.all(10),
            width: 130,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.55),
            ),
            child: Column(
              children: [
                Text(
                  recipe.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${recipe.cookingTime} min',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.orange,
                        thickness: 2,
                      ),
                      Text(
                        recipe.difficulty,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          RatingText(
            rating: recipe.rating,
            bottom: 10,
            right: 10,
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecipeDetailPage(),
                    ),
                  );
                },
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
