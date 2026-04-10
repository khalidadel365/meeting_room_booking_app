import 'package:flutter/material.dart';

abstract class BookingIntents {}

class SelectDateIntent extends BookingIntents {
  final BuildContext context;

  SelectDateIntent(this.context);
}

class SelectStartTimeIntent extends BookingIntents {
  final BuildContext context;

  SelectStartTimeIntent(this.context);
}

class SelectEndTimeIntent extends BookingIntents {
  final BuildContext context;

  SelectEndTimeIntent(this.context);
}

class ConfirmBookingIntent extends BookingIntents {
  final int roomId;

  ConfirmBookingIntent({required this.roomId});
}

class GetBookingsOfRoomIntent extends BookingIntents {
  final int roomId;

  GetBookingsOfRoomIntent({required this.roomId});
}
