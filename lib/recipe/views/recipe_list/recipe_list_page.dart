import 'package:cooking_app/recipe/models/recipe.dart';
import 'package:cooking_app/recipe/views/recipe_list/recipe_card.dart';
import 'package:cooking_app/recipe/views/recipe_list/today_recipe.dart';
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

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    print('Menu pressed');
                  },
                  icon: const Icon(Icons.menu),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(left: 20, right: 42),
              child: const Text(
                'What would you like to cook?',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 36,
                  letterSpacing: 1,
                  wordSpacing: 3,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Search for your query',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 22,
            ),
            sliver: SliverToBoxAdapter(
              child: TodayRecipe(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'see all',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return RecipeCard(recipe: recipes[index]);
              },
              childCount: recipes.length,
            ),
          ),
        ],
      ),
    );
  }
}
