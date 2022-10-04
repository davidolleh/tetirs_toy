import 'package:injectable/injectable.dart';
import 'package:tetris/datas/runtime_game/acc_repo.dart';
import 'package:tetris/datas/runtime_game/mino_repo.dart';

@module
abstract class RegisterModule {

  @singleton
  AccRepo get accRepo => AccRepo();

  @singleton
  MinoRepo get minoRepo => MinoRepo();
}