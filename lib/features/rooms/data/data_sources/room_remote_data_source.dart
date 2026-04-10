import 'package:meeting_room_booking_app/core/values/api_endpoints.dart';
import 'package:meeting_room_booking_app/features/rooms/data/models/responses/room_dto.dart';

import '../../../../core/api/api_service.dart';
import '../models/room_response.dart';

abstract class RoomRemoteDataSourceContract {
  Future<List<RoomDto>> fetchRooms();
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSourceContract {
  final ApiService apiService;

  RoomRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<RoomDto>> fetchRooms() async {
    final response = await apiService.get(endPoint: ApiEndpoints.rooms);

    final roomsResponse = RoomsResponse.fromJson(response);

    return roomsResponse.data ?? [];
  }
}
