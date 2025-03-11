import 'package:axeta/data_sources/geo_info/geo_info_api.dart';
import 'package:axeta/data_sources/geo_info/i_geo_info_api.dart';
import 'package:axeta/data_sources/user_info/i_user_info_api.dart';
import 'package:axeta/data_sources/user_info/user_info_api.dart';
import 'package:axeta/repositories/geo_info/geo_info_repository.dart';
import 'package:axeta/repositories/geo_info/i_geo_info_repository.dart';
import 'package:axeta/repositories/user_info/i_user_info_repository.dart';
import 'package:axeta/repositories/user_info/user_info_repository.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_bloc.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => MainScreenBloc(
        userInfoRepository: sl(),
        geoInfoRepository: sl(),
      ));
  sl.registerFactory(() => EditScreenBloc(
        userInfoRepository: sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<IUserInfoApi>(() => LocalUserInfoApi());
  sl.registerLazySingleton<IGeoInfoApi>(() => GeoInfoApi());

  // Repos
  sl.registerLazySingleton<IUserInfoRepository>(
    () => UserInfoRepository(
      userInfoApi: sl(),
    ),
  );
  sl.registerLazySingleton<IGeoInfoRepository>(
    () => GeoInfoRepository(
      geoInfoApi: sl(),
    ),
  );
}
