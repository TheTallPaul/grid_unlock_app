import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:meta/meta.dart';
import 'package:rides_repository/rides_repository.dart';

class RidesBloc extends Bloc<RidesEvent, RidesState> {
  RidesBloc({@required RidesRepository ridesRepository})
      : assert(ridesRepository != null),
        _ridesRepository = ridesRepository;

  final RidesRepository _ridesRepository;
  StreamSubscription _ridesSubscription;

  @override
  RidesState get initialState => RidesLoading();

  @override
  Stream<RidesState> mapEventToState(RidesEvent event) async* {
    if (event is LoadRides) {
      yield* _mapLoadRidesToState();
    } else if (event is AddRide) {
      yield* _mapAddRideToState(event);
    } else if (event is UpdateRide) {
      yield* _mapUpdateRideToState(event);
    } else if (event is RidesUpdated) {
      yield* _mapRidesUpdateToState(event);
    }
  }

  Stream<RidesState> _mapLoadRidesToState() async* {
    await _ridesSubscription?.cancel();
    _ridesSubscription = _ridesRepository.rides().listen(
          (rides) => add(RidesUpdated(rides)),
        );
  }

  Stream<RidesState> _mapAddRideToState(AddRide event) async* {
    await _ridesRepository.addNewRide(event.ride);
  }

  Stream<RidesState> _mapUpdateRideToState(UpdateRide event) async* {
    await _ridesRepository.updateRide(event.updatedRide);
  }

  Stream<RidesState> _mapRidesUpdateToState(RidesUpdated event) async* {
    yield RidesLoaded(event.rides);
  }

  @override
  Future<void> close() {
    _ridesSubscription?.cancel();
    return super.close();
  }
}
