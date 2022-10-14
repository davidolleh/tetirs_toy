// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../datas/runtime_game/acc_repo.dart' as _i3;
import '../datas/runtime_game/mino_repo.dart' as _i5;
import '../datas/runtime_game/repositories.dart' as _i8;
import '../domains/services/accumulation_block_service.dart' as _i4;
import '../domains/services/move_service.dart' as _i6;
import '../domains/services/rotate_service.dart' as _i7;
import 'register_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AccRepo>(registerModule.accRepo);
  gh.factory<_i4.AccumulateService>(
      () => _i4.AccumulateService(accRepo: get<_i3.AccRepo>()));
  gh.singleton<_i5.MinoRepo>(registerModule.minoRepo);
  gh.factory<_i6.MoveService>(() => _i6.MoveService(
      minoRepo: get<_i5.MinoRepo>(), accRepo: get<_i3.AccRepo>()));
  gh.factory<_i7.RotateService>(() => _i7.RotateService(
      minoRepo: get<_i8.MinoRepo>(), accRepo: get<_i8.AccRepo>()));
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {}
