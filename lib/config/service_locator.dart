import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/api/api_service.dart';
import '../features/bookings/data/data_sources/booking_remote_data_source.dart';
import '../features/bookings/data/repos/booking_repo_imp.dart';
import '../features/bookings/domain/repos/booking_repo_contract.dart';
import '../features/bookings/domain/use_cases/create_booking_use_case.dart';
import '../features/bookings/domain/use_cases/get_bookings_use_case.dart';
import '../features/bookings/presentation/view_model/cubit/booking_cubit.dart';
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

  getIt.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<BookingRepoContract>(
    () => BookingRepoImp(getIt.get<BookingRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetBookingsUseCase>(
    () => GetBookingsUseCase(getIt.get<BookingRepoContract>()),
  );

  getIt.registerLazySingleton<CreateBookingUseCase>(
    () => CreateBookingUseCase(getIt.get<BookingRepoContract>()),
  );

  getIt.registerFactory<BookingCubit>(
    () => BookingCubit(
      getBookingsUseCase: getIt.get<GetBookingsUseCase>(),
      createBookingUseCase: getIt.get<CreateBookingUseCase>(),
    ),
  );
}
