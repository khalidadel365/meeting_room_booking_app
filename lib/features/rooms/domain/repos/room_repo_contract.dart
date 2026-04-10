import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/room_entity.dart';

abstract class RoomRepoContract {
  Future<Either<Failure, List<RoomEntity>>> fetchRooms();
}
