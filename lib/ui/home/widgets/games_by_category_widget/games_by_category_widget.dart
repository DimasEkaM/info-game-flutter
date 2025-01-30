import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';
import 'package:my_flutter_app/ui/home/widgets/games_by_category_widget/games_by_category_success_widget.dart';

class GamesByCategoryWidget extends StatelessWidget {
  const GamesByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesByCategoryBloc, GamesByCategoryState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? GamesByCategorySuccessWidget(
                categoryName: state.categoryName,
                games: state.games,
              )
            : state.status.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state.status.isError
                    ? ErrorGameWidget()
                    : const SizedBox();
      },
    );
  }
}
