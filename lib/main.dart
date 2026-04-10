import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/core/theme/theme.dart';
import 'package:meeting_room_booking_app/features/rooms/presentation/views/rooms_view.dart';

import 'config/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  runApp(const MeetingRoomBookingApp());
}

class MeetingRoomBookingApp extends StatelessWidget {
  const MeetingRoomBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,

      home: const RoomsView(),
    );
  }
}
