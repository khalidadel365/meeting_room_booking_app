import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/booking_entity.dart';
import '../../../domain/use_cases/create_booking_use_case.dart';
import '../../../domain/use_cases/get_bookings_use_case.dart';
import '../intent/booking_intents.dart';
import '../state/booking_state.dart';

class BookingCubit extends Cubit<BookingStates> {
  final GetBookingsUseCase getBookingsUseCase;
  final CreateBookingUseCase createBookingUseCase;

  BookingCubit({
    required this.getBookingsUseCase,
    required this.createBookingUseCase,
  }) : super(BookingInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  List<BookingEntity> _allBookings = [];

  void handleIntent(BookingIntents intent) {
    if (intent is SelectDateIntent) {
      _selectDate(intent.context);
    } else if (intent is SelectStartTimeIntent) {
      _selectTime(intent.context, startTimeController);
    } else if (intent is SelectEndTimeIntent) {
      _selectTime(intent.context, endTimeController);
    } else if (intent is ConfirmBookingIntent) {
      _confirmBooking(intent.roomId);
    } else if (intent is GetBookingsOfRoomIntent) {
      _getBookingsOfRoom(intent.roomId);
    }
  }

  Future<void> _selectTime(
    BuildContext context,
    TextEditingController controller,
  ) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final String formattedTime =
          "${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}:00";
      controller.text = formattedTime;
    }
  }

  Future<void> _getBookingsOfRoom(int roomId) async {
    emit(GetBookingsLoading());
    final result = await getBookingsUseCase(roomId);

    result.fold((failure) => emit(GetBookingsError(failure.errorMessage)), (
      bookings,
    ) {
      _allBookings = bookings;
      emit(GetBookingsSuccess(bookings));
    });
  }

  int convertTime(String time) {
    var parts = time.split(':');
    return int.parse(parts[0] + parts[1]);
  }

  bool isReserved() {
    int myStart = convertTime(startTimeController.text);
    int myEnd = convertTime(endTimeController.text);

    for (var booking in _allBookings) {
      if (booking.date == dateController.text) {
        int hisStart = convertTime(booking.startTime);
        int hisEnd = convertTime(booking.endTime);

        if (myStart < hisEnd && myEnd > hisStart) {
          return true;
        }
      }
    }
    return false;
  }

  Future<void> _confirmBooking(int roomId) async {
    if (isReserved()) {
      emit(CreateBookingError("This time slot is already booked"));
      return;
    }

    emit(CreateBookingLoading());

    final result = await createBookingUseCase(
      roomId: roomId,
      date: dateController.text,
      startTime: startTimeController.text,
      endTime: endTimeController.text,
      userName: nameController.text,
    );

    result.fold((failure) => emit(CreateBookingError(failure.errorMessage)), (
      newBooking,
    ) {
      emit(CreateBookingSuccess(newBooking));
      _clearControllers();
      handleIntent(GetBookingsOfRoomIntent(roomId: roomId));
    });
  }

  void _clearControllers() {
    nameController.clear();
    dateController.clear();
    startTimeController.clear();
    endTimeController.clear();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = picked.toString().split(' ')[0];
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    return super.close();
  }
}
