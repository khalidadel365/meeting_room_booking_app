import 'package:meeting_room_booking_app/features/rooms/data/models/responses/room_dto.dart';

class RoomsResponse {
  final List<RoomDto>? data;

  RoomsResponse({this.data});

  factory RoomsResponse.fromJson(Map<String, dynamic> json) {
    return RoomsResponse(
      data: json["data"] == null
          ? []
          : (json["data"] as List).map((i) => RoomDto.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.map((i) => i.toJson()).toList(),
  };
}


