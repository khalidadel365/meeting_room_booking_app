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
    required this.startTimeController,
    required this.endTimeController,
    this.onDateTap,
    this.onStartTimeTap,
    this.onEndTimeTap,
    this.onConfirm,
    this.isLoading = false,
  });

  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final VoidCallback? onDateTap;
  final VoidCallback? onStartTimeTap;
  final VoidCallback? onEndTimeTap;
  final VoidCallback? onConfirm;
  final bool isLoading;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
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
                hintText: AppStrings.enterYourName,
                suffixIcon: const Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
                validate: (value) => (value == null || value.isEmpty)
                    ? AppStrings.nameIsRequired
                    : null,
              ),
              const SizedBox(height: 15),
              _buildFieldLabel(AppStrings.reservationDate),
              CustomTextFormField(
                controller: dateController,
                readOnly: true,
                hintText: AppStrings.selectDate,
                onTap: onDateTap,
                suffixIcon: const Icon(
                  Icons.calendar_month,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
                validate: (value) => (value == null || value.isEmpty)
                    ? AppStrings.dateIsRequired
                    : null,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel(AppStrings.startTime),
                        CustomTextFormField(
                          controller: startTimeController,
                          readOnly: true,
                          hintText: AppStrings.hintTime,
                          onTap: onStartTimeTap,
                          suffixIcon: const Icon(
                            Icons.access_time_filled_rounded,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          validate: (value) => (value == null || value.isEmpty)
                              ? AppStrings.startTimeIsRequired
                              : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel(AppStrings.endTime),
                        CustomTextFormField(
                          controller: endTimeController,
                          readOnly: true,
                          hintText: AppStrings.hintTime,
                          onTap: onEndTimeTap,
                          suffixIcon: const Icon(
                            Icons.access_time_filled_rounded,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                          validate: (value) => (value == null || value.isEmpty)
                              ? AppStrings.endTimeIsRequired
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                width: double.infinity,
                text: isLoading
                    ? AppStrings.processBooking
                    : AppStrings.confirmBooking,
                textStyle: AppTextStyles.textStyleMedium16.copyWith(
                  color: AppColors.whiteColor,
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          onConfirm?.call();
                        }
                      },
                backgroundColor: isLoading
                    ? Colors.grey
                    : AppColors.primaryColor,
                borderRadius: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        label,
        style: AppTextStyles.textStyleBold15.copyWith(color: Colors.grey[600]),
      ),
    );
  }
}
