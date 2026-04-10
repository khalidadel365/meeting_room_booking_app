class BookingEntity {
  final int id;
  final int roomId;
  final String date;
  final String startTime;
  final String endTime;
  final String userName;
  final String status;

  BookingEntity({
    required this.id,
    required this.roomId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.userName,
    required this.status,
  });
}
