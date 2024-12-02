import 'package:flutter/material.dart';

import '../device.dart';
import '../devices.dart';
import '../template.dart';
import 'device_viewport.dart';

class MultiDevice extends StatelessWidget {
  final List<Device> devices = [deviceMotoE4, pocoX3, deviceIPhoneSE2015];
  final Template template;

  MultiDevice({
    super.key,
    // required this.devices,
    required this.template,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var device in devices)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ViewPort(
                showDeviceLabel: true,
                template: template,
                duration: Duration.zero,
                themeData: ThemeData.light(useMaterial3: false),
                device: device,
              ),
            ),
        ],
      ),
    );
  }
}
