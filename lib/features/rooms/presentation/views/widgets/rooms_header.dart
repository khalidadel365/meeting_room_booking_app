import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';

class RoomsHeader extends StatelessWidget {
  const RoomsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Text(
          AppStrings.exploreRooms,
          style: AppTextStyles.textStyleBold25.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
