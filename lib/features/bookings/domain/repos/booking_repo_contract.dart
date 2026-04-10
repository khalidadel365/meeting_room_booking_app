import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/booking_entity.dart';

abstract class BookingRepoContract {
  Future<Either<Failure, List<BookingEntity>>> getBookings({
    required int roomId,
  });

  Future<Either<Failure, BookingEntity>> createBooking({
    required int roomId,
    required String date,
    required String startTime,
    required String endTime,
    required String userName,
  });
}
