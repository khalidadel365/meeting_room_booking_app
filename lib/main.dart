import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/core/theme/app_colors.dart';

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
      theme: ThemeData(
        fontFamily: AppTextStyles.fontFamily,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World', style: AppTextStyles.textStyleMedium12),
      ),
    );
  }
}
