import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({super.key});

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
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '10:00 AM - 11:00 AM',
                  style: AppTextStyles.textStyleMedium18,
                ),
                const SizedBox(height: 5),
                const Text(
                  '2026-04-10',
                  style: AppTextStyles.textStyleMedium14,
                ),
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
                        text: 'Ahmed Ali',
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
          ],
        ),
      ),
    );
  }
}
