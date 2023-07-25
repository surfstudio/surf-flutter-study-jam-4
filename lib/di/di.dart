import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_practice_magic_ball/screen/domain/repository.dart';

final instance = GetIt.instance;

Future<void> configureDependencies() async {
  instance.registerSingleton(Dio());
  instance.registerFactory<MagicBallRepository>(() => MagicBallRepositoryImpl(instance.get()));
  instance.registerFactory<ShakeRepository>(() => ShakeRepositoryImpl());
}
