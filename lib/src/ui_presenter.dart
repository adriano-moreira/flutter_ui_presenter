import 'package:flutter/material.dart';

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

const _devices = <Device>[
  Device(
    name: 'Moto E4',
    platform: TargetPlatform.android,
    screenSize: Size(360, 592),
    screenPadding: EdgeInsets.only(top: 24),
  ),
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

  UIPresenter({
    Key? key,
    this.devices = _devices,
    this.lightTheme,
    this.darkTheme,
    required this.templates,
  }) : super(key: key);

  @override
  _UIPresenterState createState() => _UIPresenterState();
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
      body: Container(
        child: Row(
          children: [
            _buildTemplates(),
            Flexible(child: _buildBody()),
            _buildDevices(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    var _duration = Duration(seconds: 1);
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                child: Center(
                  child: Text('${device.name} - ${device.screenSize}'),
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Spacer(),
                    buildViewPort(_duration, widget.lightTheme ?? ThemeData.light()),
                    SizedBox(
                      width: 30,
                    ),
                    buildViewPort(_duration, widget.darkTheme ?? ThemeData.dark()),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildViewPort(Duration _duration, ThemeData themeData) {
    return FittedBox(
      child: AnimatedContainer(
        duration: _duration,
        decoration: BoxDecoration(border: Border.all()),
        width: device.screenSize.width,
        height: device.screenSize.height,
        child: MediaQuery(
          data: MediaQueryData(
            size: device.screenSize,
            padding: device.screenPadding,
          ),
          child: MaterialApp(
            home: Theme(
              data: themeData.copyWith(platform: device.platform),
              child: Builder(builder: (context) {
                return template.builder(context);
              }),
            ),
          ),
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
    if (device.platform == TargetPlatform.android) return Icon(Icons.android);
    if (device.platform == TargetPlatform.iOS) return Text('iOS');
    return Container();
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
                leading: Icon(Icons.insert_drive_file_rounded),
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
