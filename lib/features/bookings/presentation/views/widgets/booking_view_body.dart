import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/core/theme/app_colors.dart';
import 'package:meeting_room_booking_app/core/theme/app_text_styles.dart';
import 'package:meeting_room_booking_app/core/values/app_strings.dart';

import 'booking_details_section.dart';
import 'booking_sliver_list.dart';

class BookingViewBody extends StatelessWidget {
  const BookingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController intervalController = TextEditingController();

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookingDetailsSection(
                  dateController: dateController,
                  nameController: nameController,
                  intervalController: intervalController,
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
        BookingSliverList(),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}
