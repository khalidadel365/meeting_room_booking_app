import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking_app/core/theme/app_colors.dart';

import '../../view_model/cubit/booking_cubit.dart';
import '../../view_model/state/booking_state.dart';
import 'booking_item.dart';

class BookingSliverList extends StatelessWidget {
  const BookingSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingStates>(
      builder: (context, state) {
        if (state is GetBookingsSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: BookingItem(booking: state.bookings[index]),
                );
              }, childCount: state.bookings.length),
            ),
          );
        } else if (state is GetBookingsError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(state.message),
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            ),
          );
        }
      },
    );
  }
}
