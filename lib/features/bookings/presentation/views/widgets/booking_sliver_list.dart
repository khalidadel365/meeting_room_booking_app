import 'package:flutter/material.dart';

import 'booking_item.dart';

class BookingSliverList extends StatelessWidget {
  const BookingSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: BookingItem(),
          );
        }, childCount: 5),
      ),
    );
  }
}
