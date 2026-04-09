import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/features/rooms/presentation/views/widgets/room_item.dart';

class RoomsSliverList extends StatelessWidget {
  const RoomsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const RoomItem();
        }, childCount: 10),
      ),
    );
  }
}
