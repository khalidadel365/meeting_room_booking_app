import 'package:meeting_room_booking_app/features/bookings/data/models/responses/booking_dto.dart';

class BookingResponse {
  final List<BookingDto>? data;

  BookingResponse({this.data});

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      data: json["data"] == null
          ? []
          : (json["data"] as List).map((i) => BookingDto.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.map((i) => i.toJson()).toList(),
  };
}
