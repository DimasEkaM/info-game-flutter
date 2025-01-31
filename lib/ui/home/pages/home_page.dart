import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/repository/game_repository.dart';
import 'package:my_flutter_app/repository/service/game_service.dart';
import 'package:my_flutter_app/ui/home/pages/home_layout.dart';
import 'package:my_flutter_app/ui/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'package:my_flutter_app/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:my_flutter_app/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: RepositoryProvider(
        create: (context) => GameRepository(service: GameService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AllGamesBloc>(
              create: (context) => AllGamesBloc(
                gameRepository: context.read<GameRepository>(),
              )..add(
                  GetGames(),
                ),
            ),
            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(
                gameRepository: context.read<GameRepository>(),
              )..add(
                  GetCategories(),
                ),
            ),
            BlocProvider<GamesByCategoryBloc>(
              create: (context) => GamesByCategoryBloc(
                gameRepository: context.read<GameRepository>(),
              ),
            ),
          ],
          child: HomeLayout(),
        ),
      ),
    );
  }
}
