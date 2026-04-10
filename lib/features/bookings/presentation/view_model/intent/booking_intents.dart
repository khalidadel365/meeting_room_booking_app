import 'package:flutter/material.dart';

abstract class BookingIntents {}

class SelectDateIntent extends BookingIntents {
  final BuildContext context;

  SelectDateIntent(this.context);
}

class SelectIntervalIntent extends BookingIntents {
  final BuildContext context;

  SelectIntervalIntent(this.context);
}

class ConfirmBookingIntent extends BookingIntents {}

class GetBookingsOfRoomIntent extends BookingIntents {}
