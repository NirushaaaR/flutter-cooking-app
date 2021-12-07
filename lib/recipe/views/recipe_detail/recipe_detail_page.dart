import 'package:cooking_app/recipe/views/recipe_detail/app_bar.dart';
import 'package:cooking_app/recipe/views/recipe_detail/food_background_image.dart';
import 'package:cooking_app/recipe/views/recipe_detail/recipe_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FoodBackgroundImage(
              'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1273584_8-0cfaa81.jpg'),
          CustomScrollView(
            slivers: [
              const RecipeDetailAppBar(),
              const RecipeInfo(),
            ],
          ),
        ],
      ),
    );
  }
}
