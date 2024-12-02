import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../device.dart';
import '../template.dart';

class ViewPort extends StatelessWidget {
  const ViewPort(
      {super.key,
      required this.template,
      required this.duration,
      required this.themeData,
      required this.device,
      this.showDeviceLabel = false});

  final Template template;
  final Duration duration;
  final ThemeData themeData;
  final Device device;
  final bool showDeviceLabel;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          if (showDeviceLabel)
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: Text(device.name),
              onPressed: () => showDeviceInfo(context, device),
            ),
          AnimatedContainer(
            duration: duration,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            width: device.screenSize.width,
            height: device.screenSize.height,
            child: MaterialApp(
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                platform: device.platform,
                dragDevices: PointerDeviceKind.values.toSet(),
              ),
              home: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  size: device.screenSize,
                  padding: device.screenPadding,
                ),
                child: Theme(
                  data: themeData.copyWith(platform: device.platform),
                  child: Stack(
                    children: [
                      Builder(
                        builder: (context) => Container(
                          child: template.builder(context),
                        ),
                      ),
                      if (device.screenPadding.top != 0)
                        Positioned(
                          top: 0,
                          child: AnimatedContainer(
                            duration: duration,
                            color: Colors.black.withOpacity(.5),
                            width: device.screenSize.width,
                            height: device.screenPadding.top,
                          ),
                        ),
                      if (device.screenPadding.bottom != 0)
                        Positioned(
                          bottom: 0,
                          child: AnimatedContainer(
                            duration: duration,
                            color: Colors.black.withOpacity(.5),
                            width: device.screenSize.width,
                            height: device.screenPadding.bottom,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showDeviceInfo(BuildContext context, Device device) {
    showDialog<void>(
      context: context,
      builder: (_) => Center(
        child: SizedBox(
          width: 500,
          height: 400,
          child: Material(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('name'),
                  subtitle: Text(device.name),
                ),
                ListTile(
                  title: const Text('platform'),
                  subtitle: Text(device.platform.toString()),
                ),
                ListTile(
                  title: const Text('screenSize'),
                  subtitle: Text(device.screenSize.toString()),
                ),
                ListTile(
                  title: const Text('screenPadding'),
                  subtitle: Text(device.screenPadding.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
