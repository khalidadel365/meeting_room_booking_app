import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/features/bookings/domain/entity/booking_entity.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({super.key, required this.booking});

  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Row(
          children: [
            const Icon(
              Icons.how_to_reg,
              color: AppColors.primaryColor,
              size: 28,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${booking.startTime} - ${booking.endTime}',
                    style: AppTextStyles.textStyleMedium18,
                  ),
                  const SizedBox(height: 5),
                  Text(booking.date, style: AppTextStyles.textStyleMedium14),
                  const SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${AppStrings.reservedBy} ',
                          style: AppTextStyles.textStyleMedium14.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                        TextSpan(
                          text: booking.userName,
                          style: AppTextStyles.textStyleMedium14.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
