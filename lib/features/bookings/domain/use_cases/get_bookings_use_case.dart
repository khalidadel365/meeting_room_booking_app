import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/booking_entity.dart';
import '../repos/booking_repo_contract.dart';

class GetBookingsUseCase {
  final BookingRepoContract repo;

  GetBookingsUseCase(this.repo);

  Future<Either<Failure, List<BookingEntity>>> call(int roomId) async {
    return await repo.getBookings(roomId: roomId);
  }
}
