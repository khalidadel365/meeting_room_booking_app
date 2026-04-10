import 'package:dartz/dartz.dart';
import 'package:meeting_room_booking_app/features/rooms/domain/repos/room_repo_contract.dart';
import 'package:meeting_room_booking_app/features/rooms/domain/entity/room_entity.dart';

import '../../../../core/errors/failures.dart';

class GetRoomsUseCase {
  GetRoomsUseCase(this.roomsRepoContract);

  final RoomRepoContract roomsRepoContract;

  Future<Either<Failure, List<RoomEntity>>> call() async {
    return roomsRepoContract.fetchRooms();
  }
}