import '../../../../core/api/api_service.dart';
import '../../../../core/values/api_endpoints.dart';
import '../models/booking_response.dart';
import '../models/create_booking_response.dart';

abstract class BookingRemoteDataSource {
  Future<BookingResponse> getBookings(int roomId);

  Future<CreateBookingResponse> createBooking({
    required int roomId,
    required String date,
    required String startTime,
    required String endTime,
    required String userName,
  });
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final ApiService apiService;

  BookingRemoteDataSourceImpl(this.apiService);

  @override
  Future<BookingResponse> getBookings(int roomId) async {
    final response = await apiService.get(
      endPoint: ApiEndpoints.bookings,
      queryParameters: {ApiEndpoints.roomIdFilter: roomId},
    );
    return BookingResponse.fromJson(response);
  }

  @override
  Future<CreateBookingResponse> createBooking({
    required int roomId,
    required String date,
    required String startTime,
    required String endTime,
    required String userName,
  }) async {
    final response = await apiService.post(
      endPoint: ApiEndpoints.bookings,
      data: {
        "room_id": roomId,
        "date": date,
        "start_time": startTime,
        "end_time": endTime,
        "user_name": userName,
      },
    );
    return CreateBookingResponse.fromJson(response);
  }
}
