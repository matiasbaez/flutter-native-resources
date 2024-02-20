
import 'package:flutter/material.dart';

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

class _PermissionView extends StatelessWidget {
  const _PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        CheckboxListTile(
          value: true,
          title: const Text('Camera'),
          subtitle: const Text('Current State'),
          onChanged: (value) {}
        ),

      ],
    );
  }
}