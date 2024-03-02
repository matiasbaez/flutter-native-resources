
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PermissionScreen extends StatelessWidget {

  const PermissionScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
      ),

      body: const _PermissionView()
    );
  }
}

class _PermissionView extends ConsumerWidget {
  const _PermissionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final permissions = ref.watch(permissionsProvider);

    return ListView(
      children: [

        CheckboxListTile(
          value: permissions.cameraGranted,
          title: const Text('Camera'),
          subtitle: Text('${ permissions.camera }'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          }
        ),

        CheckboxListTile(
          value: permissions.photoLibraryGranted,
          title: const Text('Photos'),
          subtitle: Text('${ permissions.photoLibrary }'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestPhotosAccess();
          }
        ),

        CheckboxListTile(
          value: permissions.sensorsGranted,
          title: const Text('Sensors'),
          subtitle: Text('${ permissions.sensors }'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          }
        ),

        CheckboxListTile(
          value: permissions.locationGranted,
          title: const Text('Location'),
          subtitle: Text('${ permissions.location }'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          }
        ),

        CheckboxListTile(
          value: permissions.locationAlwaysGranted,
          title: const Text('Location Always'),
          subtitle: Text('${ permissions.locationAlways }'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestLocationAlwaysAccess();
          }
        ),

        CheckboxListTile(
          value: permissions.locationWhenInUseGranted,
          title: const Text('Location When In Use'),
          subtitle: Text('${ permissions.locationWhenInUse }'),
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestLocationWhenInUseAccess();
          }
        ),

      ],
    );
  }
}