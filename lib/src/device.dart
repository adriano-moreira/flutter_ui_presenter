import 'package:flutter/material.dart';

/// Represent a devices data to render a DeviceViewport
class Device {
  final String name;
  final TargetPlatform platform;
  final Size screenSize;
  final EdgeInsets screenPadding;

  const Device({
    required this.name,
    required this.platform,
    required this.screenSize,
    required this.screenPadding,
  });
}
