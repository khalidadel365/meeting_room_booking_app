import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/core/theme/app_colors.dart';
import 'package:meeting_room_booking_app/core/values/app_strings.dart';
import 'package:meeting_room_booking_app/features/rooms/presentation/views/widgets/rooms_view_body.dart';

import '../../../../core/theme/app_text_styles.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.roomBooking,
          style: AppTextStyles.textStyleBold21,
        ),
      ),
      body: const SafeArea(child: RoomsViewBody()),
    );
  }
}
