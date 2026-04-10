import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../intent/booking_intents.dart';
import '../state/booking_state.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit() : super(BookingInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController intervalController = TextEditingController();

  void handleIntent(BookingIntents intent) {
    if (intent is SelectDateIntent) {
      _selectDate(intent.context);
    } else if (intent is SelectIntervalIntent) {
      _selectInterval(intent.context);
    } else if (intent is ConfirmBookingIntent) {
      _confirmBooking();
    } else if (intent is GetBookingsOfRoomIntent) {
      _getBookingsOfRoom();
    }
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

  Future<void> _selectInterval(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      intervalController.text = picked.format(context);
    }
  }

  Future<void> _confirmBooking() async {
    emit(BookingLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(BookingSuccess());
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  Future<void> _getBookingsOfRoom() async {
    emit(BookingLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(BookingSuccess());
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    dateController.dispose();
    intervalController.dispose();
    return super.close();
  }
}
