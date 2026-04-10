import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/fetch_rooms_use_case.dart';
import '../intent/room_intent.dart';
import '../state/room_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  final GetRoomsUseCase getRoomsUseCase;

  RoomsCubit(this.getRoomsUseCase) : super(FetchRoomsInitial());

  void handleIntent(RoomIntents intent) {
    if (intent is GetAllRoomsIntent) {
      _fetchRooms();
    }
  }

  Future<void> _fetchRooms() async {
    emit(FetchRoomsLoading());
    final result = await getRoomsUseCase();
    result.fold(
      (failure) => emit(FetchRoomsError(failure.errorMessage)),
      (rooms) => emit(FetchRoomsSuccess(rooms)),
    );
  }
}
