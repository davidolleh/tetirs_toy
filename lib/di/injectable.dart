import'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

/// Must call this in main.dart to ensure DI usage of the package
@InjectableInit()
Future<void> configureDI() async =>
    $initGetIt(getIt,
      // environmentFilter: SimpleEnvironmentFilter(
      //     filter: (p0) => true,
      //     environments: {Environment.test, Environment.dev, Environment.prod}
      // )
    );