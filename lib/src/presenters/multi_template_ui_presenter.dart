import 'package:flutter/material.dart';

import '../device.dart';
import '../devices.dart';
import '../template.dart';
import 'device_viewport.dart';

class MultiTemplate extends StatefulWidget {
  final List<Template> templates;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;

  const MultiTemplate({
    Key? key,
    this.lightTheme,
    this.darkTheme,
    required this.templates,
  }) : super(key: key);

  @override
  State<MultiTemplate> createState() => _MultiTemplateState();
}

class _MultiTemplateState extends State<MultiTemplate> {
  late Device device;
  late Template template;

  @override
  void initState() {
    super.initState();
    device = devices.first;
    template = widget.templates.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildTemplates(),
          Flexible(
            child: _buildBody(),
          ),
          _buildDevices(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    var duration = const Duration(seconds: 1);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Center(
                child: Text('${device.name} - ${device.screenSize}'),
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  const Spacer(),
                  ViewPort(
                    duration: duration,
                    themeData: widget.lightTheme ?? ThemeData.light(),
                    device: device,
                    template: template,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ViewPort(
                    duration: duration,
                    themeData: widget.darkTheme ?? ThemeData.dark(),
                    device: device,
                    template: template,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDevices() {
    return Material(
      elevation: 20,
      child: SizedBox(
        width: 260,
        child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (ctx, i) {
            final device = devices[i];
            return ListTile(
              selected: this.device == device,
              onTap: () {
                setState(() {
                  this.device = device;
                });
              },
              leading: getDeviceIcon(device),
              title: Text(device.name),
            );
          },
        ),
      ),
    );
  }

  Widget getDeviceIcon(Device device) {
    if (device.platform == TargetPlatform.android) {
      return const Icon(Icons.android);
    }
    if (device.platform == TargetPlatform.iOS) {
      return const Text('iOS');
    }
    return const SizedBox();
  }

  Widget _buildTemplates() {
    return SizedBox(
      width: 260,
      child: Material(
        elevation: 20,
        child: ListView(
          children: [
            for (final template in widget.templates)
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                selected: this.template == template,
                onTap: () {
                  setState(() {
                    this.template = template;
                  });
                },
                title: Text(template.name),
              ),
          ],
        ),
      ),
    );
  }
}
