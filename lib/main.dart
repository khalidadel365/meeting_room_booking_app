import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/core/theme/app_colors.dart';
import 'package:meeting_room_booking_app/features/rooms/presentation/views/rooms_view.dart';

import 'config/service_locator.dart';
import 'core/theme/app_text_styles.dart';

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
      theme: ThemeData(
        fontFamily: AppTextStyles.fontFamily,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: const RoomsView(),
    );
  }
}
