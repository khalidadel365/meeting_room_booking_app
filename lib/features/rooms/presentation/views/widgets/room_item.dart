import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/core/theme/app_text_styles.dart';
import 'package:meeting_room_booking_app/core/values/app_strings.dart';
import 'package:meeting_room_booking_app/core/widgets/custom_button.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entity/room_entity.dart';

class RoomItem extends StatelessWidget {
  final RoomEntity room;

  const RoomItem({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 18,
          right: 32.0,
          left: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(room.name, style: AppTextStyles.textStyleSemiBold45),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.people, color: AppColors.iconColor, size: 24),
                const SizedBox(width: 8),
                Text(
                  '${AppStrings.capacity}: ${room.capacity}',
                  style: AppTextStyles.textStyleSemiBold15,
                ),
                const Spacer(),
                Icon(Icons.analytics, color: AppColors.primaryColor, size: 24),
                const SizedBox(width: 8),
                Text(
                  '${AppStrings.status}: ${room.status}',
                  style: AppTextStyles.textStyleSemiBold15,
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                backgroundColor: AppColors.primaryColor,
                borderRadius: 8,
                width: 150,
                height: 50,
                text: AppStrings.bookNow,
                textStyle: AppTextStyles.textStyleBold15.copyWith(
                  color: AppColors.whiteColor,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
