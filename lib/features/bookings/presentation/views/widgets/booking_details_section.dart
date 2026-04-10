import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_textformfield.dart';

class BookingDetailsSection extends StatelessWidget {
  const BookingDetailsSection({super.key, required this.DateController});

  final TextEditingController DateController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.512,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.bookingDetails,
              style: AppTextStyles.textStyleMedium20.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppStrings.userName,
              style: AppTextStyles.textStyleBold15.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(height: 5),
            CustomTextFormField(
              controller: DateController,
              hintText: "Khalid Adel",
              hintTextStyle: AppTextStyles.textStyleMedium16.copyWith(
                color: AppColors.greyColor[600],
              ),
              suffixIcon: Icon(
                Icons.person,
                color: AppColors.primaryColor,
                size: 20,
              ),
              onTap: () {},
            ),
            const SizedBox(height: 15),
            Text(
              AppStrings.reservationDate,
              style: AppTextStyles.textStyleBold15.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(height: 5),
            CustomTextFormField(
              controller: DateController,
              hintText: "2026-04-20",
              hintTextStyle: AppTextStyles.textStyleMedium16.copyWith(
                color: AppColors.greyColor[600],
              ),
              suffixIcon: Icon(
                Icons.calendar_month,
                color: AppColors.primaryColor,
                size: 20,
              ),
              onTap: () {},
            ),
            const SizedBox(height: 15),
            Text(
              AppStrings.selectedInterval,
              style: AppTextStyles.textStyleBold15.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(height: 5),
            CustomTextFormField(
              controller: DateController,
              hintText: '10:00 AM - 11:00 AM',
              hintTextStyle: AppTextStyles.textStyleMedium16.copyWith(
                color: AppColors.greyColor[600],
              ),
              suffixIcon: Icon(
                Icons.access_time_filled_rounded,
                color: AppColors.primaryColor,
                size: 20,
              ),
              onTap: () {},
            ),
            const Spacer(),
            CustomButton(
              width: double.infinity,
              text: AppStrings.confirmBooking,
              textStyle: AppTextStyles.textStyleMedium16.copyWith(
                color: AppColors.whiteColor,
              ),
              backgroundColor: AppColors.primaryColor,
              borderRadius: 12,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
