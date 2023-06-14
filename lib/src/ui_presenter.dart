import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget withDevFrame(Widget app) => DevFrame(app: app);

class DevFrame extends StatefulWidget {
  const DevFrame({
    super.key,
    required this.app,
  });

  final Widget app;

  @override
  State<DevFrame> createState() => _DevFrameState();
}

class _DevFrameState extends State<DevFrame> {
  final device = _deviceMotoE4;

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
                child: widget.app,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

const _deviceMotoE4 = Device(
  name: 'Moto E4',
  platform: TargetPlatform.android,
  screenSize: Size(360, 592),
  screenPadding: EdgeInsets.only(top: 24),
);

const _sansungJ7Prime = Device(
  name: 'Sansung galaxy j7 prime',
  platform: TargetPlatform.android,
  screenSize: Size(360, 640),
  screenPadding: EdgeInsets.only(top: 24),
);

const _pocoX3 = Device(
  name: 'POCO X3',
  platform: TargetPlatform.android,
  screenSize: Size(392.7, 872.7),
  screenPadding: EdgeInsets.only(top: 33.1),
);

const _devices = <Device>[
  _deviceMotoE4,
  _sansungJ7Prime,
  _pocoX3,
  Device(
    name: 'iPhone 5/5S/SE(2015)',
    platform: TargetPlatform.iOS,
    screenSize: Size(320, 568),
    screenPadding: EdgeInsets.only(top: 20),
  ),
  Device(
    name: 'iPhone 6/7/8/SE(2020)',
    platform: TargetPlatform.iOS,
    screenSize: Size(357, 667),
    screenPadding: EdgeInsets.only(top: 20),
  ),
  Device(
    name: 'iPhone 6/7/8 Plus',
    platform: TargetPlatform.iOS,
    screenSize: Size(414, 736),
    screenPadding: EdgeInsets.only(top: 20),
  ),
  Device(
    name: 'iPhone 12 mini',
    platform: TargetPlatform.iOS,
    screenSize: Size(375, 812),
    screenPadding: EdgeInsets.only(top: 50, bottom: 34),
  ),
  Device(
    name: 'iPhone 12 Pro Max',
    platform: TargetPlatform.iOS,
    screenSize: Size(428, 926),
    screenPadding: EdgeInsets.only(top: 47, bottom: 34),
  ),
];

class Template {
  final String name;
  final WidgetBuilder builder;

  Template({
    required this.name,
    required this.builder,
  });
}

class UIPresenter extends StatefulWidget {
  final List<Device> devices;
  final List<Template> templates;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;

  const UIPresenter({
    Key? key,
    this.devices = _devices,
    this.lightTheme,
    this.darkTheme,
    required this.templates,
  }) : super(key: key);

  @override
  State<UIPresenter> createState() => _UIPresenterState();
}

class _UIPresenterState extends State<UIPresenter> {
  late Device device;
  late Template template;

  @override
  void initState() {
    super.initState();
    device = widget.devices.first;
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
          itemCount: widget.devices.length,
          itemBuilder: (ctx, i) {
            final device = widget.devices[i];
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

class ViewPort extends StatelessWidget {
  const ViewPort({
    Key? key,
    required this.template,
    required this.duration,
    required this.themeData,
    required this.device,
  }) : super(key: key);

  final Template template;
  final Duration duration;
  final ThemeData themeData;
  final Device device;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: AnimatedContainer(
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
    );
  }
}
