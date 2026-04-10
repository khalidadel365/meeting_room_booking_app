import '../../../domain/entity/booking_entity.dart';

class BookingDto {
  final int? id;
  final String? status;
  final dynamic sort;
  final String? userCreated;
  final DateTime? dateCreated;
  final dynamic userUpdated;
  final dynamic dateUpdated;
  final int? roomId;
  final String? date;
  final String? startTime;
  final String? endTime;
  final String? userName;

  BookingDto({
    this.id,
    this.status,
    this.sort,
    this.userCreated,
    this.dateCreated,
    this.userUpdated,
    this.dateUpdated,
    this.roomId,
    this.date,
    this.startTime,
    this.endTime,
    this.userName,
  });

  factory BookingDto.fromJson(Map<String, dynamic> json) {
    return BookingDto(
      id: json["id"],
      status: json["status"],
      sort: json["sort"],
      userCreated: json["user_created"],
      dateCreated: json["date_created"] == null
          ? null
          : DateTime.tryParse(json["date_created"]),
      userUpdated: json["user_updated"],
      dateUpdated: json["date_updated"],
      roomId: json["room_id"],
      date: json["date"],
      startTime: json["start_time"],
      endTime: json["end_time"],
      userName: json["user_name"],
    );
  }

  BookingEntity toDomain() {
    return BookingEntity(
      id: id ?? 0,
      roomId: roomId ?? 0,
      date: date ?? '',
      startTime: startTime ?? '',
      endTime: endTime ?? '',
      userName: userName ?? 'Unknown User',
      status: status ?? 'draft',
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "sort": sort,
    "user_created": userCreated,
    "date_created": dateCreated?.toIso8601String(),
    "user_updated": userUpdated,
    "date_updated": dateUpdated,
    "room_id": roomId,
    "date": date,
    "start_time": startTime,
    "end_time": endTime,
    "user_name": userName,
  };
}
