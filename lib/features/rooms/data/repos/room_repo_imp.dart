import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meeting_room_booking_app/features/rooms/data/data_sources/room_remote_data_source.dart';
import 'package:meeting_room_booking_app/features/rooms/domain/repos/room_repo_contract.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entity/room_entity.dart';

class RoomRepoImp implements RoomRepoContract {
  RoomRepoImp({required this.roomRemoteDataSourceContract});

  final RoomRemoteDataSourceContract roomRemoteDataSourceContract;

  @override
  Future<Either<Failure, List<RoomEntity>>> fetchRooms() async {
    try {
      final roomsDTO = await roomRemoteDataSourceContract.fetchRooms();
      final roomEntities = roomsDTO.map((dto) => dto.toDomain()).toList();
      return Right(roomEntities);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure('Opps there was an error, please try again'));
    }
  }
}
