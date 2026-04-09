import 'package:flutter/material.dart';
import 'package:meeting_room_booking_app/features/rooms/presentation/views/widgets/rooms_header.dart';
import 'package:meeting_room_booking_app/features/rooms/presentation/views/widgets/rooms_sliver_list.dart';

class RoomsViewBody extends StatelessWidget {
  const RoomsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [RoomsHeader(), RoomsSliverList()],
    );
  }
}
