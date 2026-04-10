import '../../../domain/entity/room_entity.dart';

abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class FetchRoomsLoading extends RoomsState {}

class FetchRoomsSuccess extends RoomsState {
  final List<RoomEntity> rooms;
  FetchRoomsSuccess(this.rooms);
}

class FetchRoomsError extends RoomsState {
  final String errorMessage;
  FetchRoomsError(this.errorMessage);
}
