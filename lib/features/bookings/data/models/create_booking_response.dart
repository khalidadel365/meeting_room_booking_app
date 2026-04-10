import 'package:meeting_room_booking_app/features/bookings/data/models/responses/booking_dto.dart';

class CreateBookingResponse {
  final BookingDto? data;

  CreateBookingResponse({this.data});

  factory CreateBookingResponse.fromJson(Map<String, dynamic> json) {
    return CreateBookingResponse(
      data: json["data"] == null ? null : BookingDto.fromJson(json["data"]),
    );
  }
}
