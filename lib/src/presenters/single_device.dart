import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../devices.dart';
import '../template.dart';

/// A single DeviceViewPortWrapper
class SingleDevice extends StatefulWidget {
  const SingleDevice({
    super.key,
    required this.template,
  });

  final Template template;

  @override
  State<SingleDevice> createState() => _SingleDeviceState();
}

class _SingleDeviceState extends State<SingleDevice> {
  final device = deviceMotoE4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: ScrollConfiguration(
            behavior: const MaterialScrollBehavior().copyWith(
              platform: device.platform,
              dragDevices: PointerDeviceKind.values.toSet(),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                platform: device.platform,
              ),
              child: SizedBox(
                width: device.screenSize.width,
                height: device.screenSize.height,
                child: widget.template.builder(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
