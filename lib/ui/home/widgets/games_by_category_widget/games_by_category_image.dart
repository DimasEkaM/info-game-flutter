import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/ui/home/widgets/games_by_category_widget/games_by_category_title.dart';

class GameByCategoryImage extends StatelessWidget {
  const GameByCategoryImage({
    super.key,
    required this.name,
    required this.backgroundImage,
  });

  final String name;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Stack(
        children: [
          Container(
            width: 270.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black45,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 18.0,
            child: GameByCategoryTitle(
              name: name,
            ),
          ),
        ],
      ),
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: Colors.deepOrangeAccent,
      ),
    );
  }
}