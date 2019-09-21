import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grid_unlock/src/blocs/blocs.dart';

import 'package:permission_handler/permission_handler.dart';

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  final PermissionHandler _permissionHandler = PermissionHandler();

  Future<bool> _requestPermission(PermissionGroup permission) async {
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  @override
  PermissionsState get initialState => PermissionsEmpty();

  @override
  Stream<PermissionsState> mapEventToState(PermissionsEvent event) async* {
    if (event is RequestLocationPermission) {
      yield PermissionsRequesting();
      try {
        yield (PermissionsRequested(
            locationWhenInUse:
                _requestPermission(PermissionGroup.locationWhenInUse)));
      } catch (_) {
        yield PermissionsError();
      }
    }
  }
}
