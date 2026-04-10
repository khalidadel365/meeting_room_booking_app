import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking_app/core/theme/app_colors.dart';
import 'package:meeting_room_booking_app/core/theme/app_text_styles.dart';
import 'package:meeting_room_booking_app/core/values/app_strings.dart';

import '../../view_model/cubit/booking_cubit.dart';
import '../../view_model/intent/booking_intents.dart';
import '../../view_model/state/booking_state.dart';
import 'booking_details_section.dart';
import 'booking_sliver_list.dart';

class BookingViewBody extends StatelessWidget {
  const BookingViewBody({super.key, required this.roomId});

  final int roomId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<BookingCubit, BookingStates>(
                  buildWhen: (previous, current) =>
                  current is CreateBookingLoading ||
                      current is CreateBookingSuccess ||
                      current is CreateBookingError,
                  builder: (context, state) {
                    return BookingDetailsSection(
                      nameController: cubit.nameController,
                      dateController: cubit.dateController,
                      startTimeController: cubit.startTimeController,
                      endTimeController: cubit.endTimeController,
                      isLoading: state is CreateBookingLoading,
                      onDateTap: () =>
                          cubit.handleIntent(SelectDateIntent(context)),
                      onStartTimeTap: () =>
                          cubit.handleIntent(SelectStartTimeIntent(context)),
                      onEndTimeTap: () =>
                          cubit.handleIntent(SelectEndTimeIntent(context)),
                      onConfirm: () =>
                          cubit.handleIntent(ConfirmBookingIntent(roomId: roomId)),
                    );
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  AppStrings.scheduleOverview,
                  style: AppTextStyles.textStyleRegular20.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        const BookingSliverList(),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}