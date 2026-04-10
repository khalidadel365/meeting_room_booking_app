import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_textformfield.dart';

class BookingDetailsSection extends StatelessWidget {
  const BookingDetailsSection({
    super.key,
    required this.nameController,
    required this.dateController,
    required this.intervalController,
  });

  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController intervalController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.bookingDetails,
              style: AppTextStyles.textStyleMedium20.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),

            _buildFieldLabel(AppStrings.userName),
            CustomTextFormField(
              controller: nameController,
              hintText: "Enter your name",
              suffixIcon: Icon(
                Icons.person,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ),

            const SizedBox(height: 15),

            _buildFieldLabel(AppStrings.reservationDate),
            CustomTextFormField(
              controller: dateController,
              readOnly: true,
              hintText: "Select Date",
              suffixIcon: Icon(
                Icons.calendar_month,
                color: AppColors.primaryColor,
                size: 20,
              ),
              onTap: () {},
            ),

            const SizedBox(height: 15),

            _buildFieldLabel(AppStrings.selectedInterval),
            CustomTextFormField(
              controller: intervalController,
              readOnly: true,
              hintText: 'Select Interval',
              suffixIcon: Icon(
                Icons.access_time_filled_rounded,
                color: AppColors.primaryColor,
                size: 20,
              ),
              onTap: () {},
            ),

            const SizedBox(height: 30),

            CustomButton(
              width: double.infinity,
              text: AppStrings.confirmBooking,
              textStyle: AppTextStyles.textStyleMedium16.copyWith(
                color: AppColors.whiteColor,
              ),
              onPressed: () {},
              backgroundColor: AppColors.primaryColor,
              borderRadius: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        label,
        style: AppTextStyles.textStyleBold15.copyWith(
          color: AppColors.greyColor[600],
        ),
      ),
    );
  }
}
