
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:permission_handler/permission_handler.dart';

final permissionsProvider = StateNotifierProvider<PermissionsNotifier, PermissionsState>((ref) {
  return PermissionsNotifier();
});

// Notifier
class PermissionsNotifier extends StateNotifier<PermissionsState> {

  PermissionsNotifier() : super ( PermissionsState() );

  Future<void> checkPermissions() async {

    final permissions = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,

      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera : permissions[0],
      photoLibrary : permissions[1],
      sensors : permissions[2],
      location : permissions[3],
      locationAlways : permissions[4],
      locationWhenInUse : permissions[5]
    );

  }

  _shouldOpenAppSettings(PermissionStatus status) {
    if ( status == PermissionStatus.permanentlyDenied ) {
      openAppSettings();
    }
  }

  requestCameraAccess() async {
    final status = await Permission.camera.request();
    state = state.copyWith( camera: status );

    _shouldOpenAppSettings( status );
  }

  requestPhotosAccess() async {
    final status = await Permission.photos.request();
    state = state.copyWith( photoLibrary: status );

    _shouldOpenAppSettings( status );
  }

  requestSensorsAccess() async {
    final status = await Permission.sensors.request();
    state = state.copyWith( sensors: status );

    _shouldOpenAppSettings( status );
  }

  requestLocationAccess() async {
    final status = await Permission.location.request();
    state = state.copyWith( location: status );

    _shouldOpenAppSettings( status );
  }

  requestLocationAlwaysAccess() async {
    final status = await Permission.locationAlways.request();
    state = state.copyWith( locationAlways: status );

    _shouldOpenAppSettings( status );
  }

  requestLocationWhenInUseAccess() async {
    final status = await Permission.locationWhenInUse.request();
    state = state.copyWith( locationWhenInUse: status );

    _shouldOpenAppSettings( status );
  }

}

// State
class PermissionsState {

  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;

  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionsState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied
  });

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) => PermissionsState(
    camera: camera ?? this.camera,
    photoLibrary: photoLibrary ?? this.photoLibrary,
    sensors: sensors ?? this.sensors,
    location: location ?? this.location,
    locationAlways: locationAlways ?? this.locationAlways,
    locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
  );

}
