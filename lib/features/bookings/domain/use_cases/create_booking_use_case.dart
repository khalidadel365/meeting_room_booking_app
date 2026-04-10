import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/booking_entity.dart';
import '../repos/booking_repo_contract.dart';

class CreateBookingUseCase {
  final BookingRepoContract repository;

  CreateBookingUseCase(this.repository);

  Future<Either<Failure, BookingEntity>> call({
    required int roomId,
    required String date,
    required String startTime,
    required String endTime,
    required String userName,
  }) async {
    return await repository.createBooking(
      roomId: roomId,
      date: date,
      startTime: startTime,
      endTime: endTime,
      userName: userName,
    );
  }
}
