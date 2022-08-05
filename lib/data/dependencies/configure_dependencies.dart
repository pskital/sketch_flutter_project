import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/constants/environment_mode.dart';
import 'package:sketch_flutter_project/data/dependencies/configure_dependencies.config.dart';

final serviceLocator = GetIt.instance;

const devEnv = Environment(EnvironmentMode.dev);
const prodEnv = Environment(EnvironmentMode.prod);

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies(String environment) => $initGetIt(
      serviceLocator,
      environment: environment,
    );
