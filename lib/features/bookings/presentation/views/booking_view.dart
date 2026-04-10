import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking_app/features/bookings/presentation/views/widgets/booking_view_body.dart';

import '../../../../config/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';
import '../view_model/cubit/booking_cubit.dart';
import '../view_model/intent/booking_intents.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.roomId});

  final int roomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 10),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        titleSpacing: 2,
        title: Text(
          AppStrings.reserveRoom,
          style: AppTextStyles.textStyleBold21,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            getIt<BookingCubit>()
              ..handleIntent(GetBookingsOfRoomIntent(roomId: roomId)),
        child: BookingViewBody(roomId: roomId),
      ),
    );
  }
}
