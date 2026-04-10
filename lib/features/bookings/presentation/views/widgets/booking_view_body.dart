import 'package:flutter/material.dart';

import 'booking_details_section.dart';

class BookingViewBody extends StatelessWidget {
  const BookingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController DateController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
      child: Column(
        children: [BookingDetailsSection(DateController: DateController)],
      ),
    );
  }
}
