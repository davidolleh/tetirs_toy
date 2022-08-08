import 'package:auto_route/auto_route.dart';
import 'package:tetris/pages/game/presentation/game.dart';
import 'package:tetris/pages/select_game/presentation/select_game.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SelectGamePage, initial: true),
    AutoRoute(page: GamePage, path: '/game')
  ]
)

class $AppRouter {}