// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../pages/game/presentation/game.dart' as _i2;
import '../pages/select_game/presentation/select_game.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SelectGameRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SelectGamePage());
    },
    GameRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.GamePage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SelectGameRoute.name, path: '/'),
        _i3.RouteConfig(GameRoute.name, path: '/runtime_game')
      ];
}

/// generated route for
/// [_i1.SelectGamePage]
class SelectGameRoute extends _i3.PageRouteInfo<void> {
  const SelectGameRoute() : super(SelectGameRoute.name, path: '/');

  static const String name = 'SelectGameRoute';
}

/// generated route for
/// [_i2.GamePage]
class GameRoute extends _i3.PageRouteInfo<void> {
  const GameRoute() : super(GameRoute.name, path: '/runtime_game');

  static const String name = 'GameRoute';
}
