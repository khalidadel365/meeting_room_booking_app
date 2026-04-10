import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/api/api_service.dart';
import '../features/rooms/data/data_sources/room_remote_data_source.dart';
import '../features/rooms/data/repos/room_repo_imp.dart';
import '../features/rooms/domain/repos/room_repo_contract.dart';
import '../features/rooms/domain/use_cases/fetch_rooms_use_case.dart';
import '../features/rooms/presentation/view_model/cubit/room_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt.get<Dio>()));

  getIt.registerLazySingleton<RoomRemoteDataSourceContract>(
    () => RoomRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<RoomRepoContract>(
    () => RoomRepoImp(
      roomRemoteDataSourceContract: getIt.get<RoomRemoteDataSourceContract>(),
    ),
  );

  getIt.registerLazySingleton<GetRoomsUseCase>(
    () => GetRoomsUseCase(getIt.get<RoomRepoContract>()),
  );

  getIt.registerFactory<RoomsCubit>(
    () => RoomsCubit(getIt.get<GetRoomsUseCase>()),
  );
}
