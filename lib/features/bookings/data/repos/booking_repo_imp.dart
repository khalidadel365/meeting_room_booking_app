import 'package:dartz/dartz.dart';
import 'package:meeting_room_booking_app/core/errors/failures.dart';
import 'package:meeting_room_booking_app/core/values/app_strings.dart';
import 'package:meeting_room_booking_app/features/bookings/data/data_sources/booking_remote_data_source.dart';
import 'package:meeting_room_booking_app/features/bookings/domain/entity/booking_entity.dart';
import 'package:meeting_room_booking_app/features/bookings/domain/repos/booking_repo_contract.dart';

class BookingRepoImp implements BookingRepoContract {
  final BookingRemoteDataSource bookingRemoteDataSource;

  BookingRepoImp(this.bookingRemoteDataSource);

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookings({
    required int roomId,
  }) async {
    try {
      final response = await bookingRemoteDataSource.getBookings(roomId);
      final List<BookingEntity> bookings =
          response.data?.map((dto) => dto.toDomain()).toList() ?? [];
      return Right(bookings);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> createBooking({
    required int roomId,
    required String date,
    required String startTime,
    required String endTime,
    required String userName,
  }) async {
    try {
      final response = await bookingRemoteDataSource.createBooking(
        roomId: roomId,
        date: date,
        startTime: startTime,
        endTime: endTime,
        userName: userName,
      );

      if (response.data != null) {
        return Right(response.data!.toDomain());
      } else {
        return Left(ServerFailure(AppStrings.somethingWentWrong));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
