import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking_app/core/theme/app_colors.dart';
import 'package:meeting_room_booking_app/features/rooms/presentation/views/widgets/room_item.dart';

import '../../view_model/cubit/room_cubit.dart';
import '../../view_model/state/room_state.dart';

class RoomsSliverList extends StatelessWidget {
  const RoomsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomsCubit, RoomsState>(
      builder: (context, state) {
        if (state is FetchRoomsSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return RoomItem(room: state.rooms[index]);
              }, childCount: state.rooms.length),
            ),
          );
        } else if (state is FetchRoomsError) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
      },
    );
  }
}
