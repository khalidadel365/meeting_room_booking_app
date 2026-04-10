import '../../../domain/entity/booking_entity.dart';

abstract class BookingStates {}

class BookingInitial extends BookingStates {}

class GetBookingsLoading extends BookingStates {}

class GetBookingsSuccess extends BookingStates {
  final List<BookingEntity> bookings;

  GetBookingsSuccess(this.bookings);
}

class GetBookingsError extends BookingStates {
  final String message;

  GetBookingsError(this.message);
}

class CreateBookingLoading extends BookingStates {}

class CreateBookingSuccess extends BookingStates {
  final BookingEntity newBooking;

  CreateBookingSuccess(this.newBooking);
}

class CreateBookingError extends BookingStates {
  final String message;

  CreateBookingError(this.message);
}
