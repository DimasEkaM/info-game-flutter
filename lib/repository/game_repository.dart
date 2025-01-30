

import 'package:my_flutter_app/repository/models/game.dart';
import 'package:my_flutter_app/repository/models/genre.dart';
import 'package:my_flutter_app/repository/models/result.dart';

import 'service/game_service.dart';

class GameRepository {
  const GameRepository({
    required this.service,
  });
  final GameService service;

  Future<Game> getGames() async => service.getGames();

  Future<List<Genre>> getGenres() async => service.getGenres();

  Future<List<Result>> getGamesByCategory(int genreId) async =>
      service.getGamesByCategory(genreId);
}