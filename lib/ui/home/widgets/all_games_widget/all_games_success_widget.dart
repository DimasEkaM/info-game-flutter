import 'package:flutter/material.dart';
import 'package:my_flutter_app/repository/models/result.dart';
import 'package:my_flutter_app/ui/home/widgets/all_games_widget/all_games_item.dart';

class AllGamesSuccessWidget extends StatelessWidget {
  const AllGamesSuccessWidget(
      {super.key, required this.games, required this.title});

  final List<Result> games;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        SizedBox(
          height:
              ((100 * games.length) + MediaQuery.of(context).size.width) + 24.0,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 24.0,
            ),
            itemBuilder: (context, index) {
              return AllGamesItem(
                game: games[index],
              );
            },
            separatorBuilder: (_, __) => SizedBox(
              height: 20.0,
            ),
            itemCount: games.length,
          ),
        ),
      ],
    );
  }
}
