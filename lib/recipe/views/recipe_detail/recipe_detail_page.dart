import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const ingrediants = [
  '4 boneless skinless chicken breasts Kosher salt',
  'Freshly ground black pepper',
  '4 oz. cream cheese, softened',
  '1/2 c. frozen spinach. defrosted and drained'
];

const directions = [
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris justo arcu, condimentum eget nisl vitae, posuere egestas dolor. Sed scelerisque nisi et mi tincidunt ornare sed dictum metus.',
  'Ut vitae metus urna. Fusce tristique augue posuere dictum elementum. Phasellus tincidunt sapien felis, sed maximus lacus pharetra in.',
  'vitae hendrerit ante vulputate et. Integer porttitor turpis sed tempus volutpat. Sed pellentesque elementum lectus, id cursus est tincidunt nec. Suspendisse potenti. Cras felis odio, euismod vel odio in, tristique placerat erat. Donec rhoncus nec sem non eleifend.',
];

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1273584_8-0cfaa81.jpg',
                ),
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.transparent,
                actions: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      iconSize: 28,
                      onPressed: () {
                        print('Bookmark');
                      },
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sausage & leek mash pie',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const _RecipeInfoIcon(
                                color: Color(0xFF5AC086),
                                text: '40 MIN',
                                iconData: Icons.timelapse,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              const _RecipeInfoIcon(
                                color: Colors.orange,
                                text: 'MEDIUM',
                                iconData: Icons.emoji_emotions_outlined,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              _RecipeInfoIcon(
                                color: Colors.blueAccent.shade100,
                                text: '300 cal/serving',
                                iconData: CupertinoIcons.flame,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Ingrediants: ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const _Ingrediants(
                            ingrediants: ingrediants,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const Text(
                            'Directions: ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const _Directions(
                            directions: directions,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Directions extends StatelessWidget {
  final List<String> directions;

  const _Directions({
    Key? key,
    required this.directions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        directions.length,
        (index) => renderDirection(
          directions[index],
          index,
        ),
      ),
    );
  }

  Widget renderDirection(String text, int index) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 10),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 16,
        ),
      ),
      leading: Container(
        padding: const EdgeInsets.fromLTRB(0, 6, 12, 6),
        child: Text(
          '${index + 1}',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 4,
              color: Color(0xFF5AC086),
            ),
          ),
        ),
      ),
    );
  }
}

class _Ingrediants extends StatelessWidget {
  final List<String> ingrediants;

  const _Ingrediants({
    Key? key,
    required this.ingrediants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingrediants.map(renderIngrediantText).toList(),
    );
  }

  Widget renderIngrediantText(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.circle_rounded,
            color: Colors.orange,
            size: 10,
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}

class _RecipeInfoIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;

  const _RecipeInfoIcon({
    Key? key,
    required this.iconData,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 62,
              width: 62,
              child: Icon(
                iconData,
                color: color,
                size: 62,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
