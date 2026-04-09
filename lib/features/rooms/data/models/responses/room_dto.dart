class RoomDto {
  final int? id;
  final String? status;
  final dynamic sort;
  final String? userCreated;
  final DateTime? dateCreated;
  final dynamic userUpdated;
  final dynamic dateUpdated;
  final String? name;
  final int? capacity;

  RoomDto({
    this.id,
    this.status,
    this.sort,
    this.userCreated,
    this.dateCreated,
    this.userUpdated,
    this.dateUpdated,
    this.name,
    this.capacity,
  });

  factory RoomDto.fromJson(Map<String, dynamic> json) {
    return RoomDto(
      id: json["id"],
      status: json["status"],
      sort: json["sort"],
      userCreated: json["user_created"],
      dateCreated: json["date_created"] == null
          ? null
          : DateTime.tryParse(json["date_created"]),
      userUpdated: json["user_updated"],
      dateUpdated: json["date_updated"],
      name: json["name"],
      capacity: json["capacity"],
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
    "name": name,
    "capacity": capacity,
  };
}