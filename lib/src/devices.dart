import 'package:flutter/material.dart';

import 'device.dart';

const deviceMotoE4 = Device(
  name: 'Moto E4',
  platform: TargetPlatform.android,
  screenSize: Size(360, 592),
  screenPadding: EdgeInsets.only(top: 24),
);

const sansungJ7Prime = Device(
  name: 'Sansung galaxy j7 prime',
  platform: TargetPlatform.android,
  screenSize: Size(360, 640),
  screenPadding: EdgeInsets.only(top: 24),
);

const pocoX3 = Device(
  name: 'POCO X3',
  platform: TargetPlatform.android,
  screenSize: Size(392.7, 872.7),
  screenPadding: EdgeInsets.only(top: 33.1),
);

const deviceIPhoneSE2015 = Device(
  name: 'iPhone 5/5S/SE(2015)',
  platform: TargetPlatform.iOS,
  screenSize: Size(320, 568),
  screenPadding: EdgeInsets.only(top: 20),
);
const deviceIPhoneSE2020 = Device(
  name: 'iPhone 6/7/8/SE(2020)',
  platform: TargetPlatform.iOS,
  screenSize: Size(357, 667),
  screenPadding: EdgeInsets.only(top: 20),
);

const devices = <Device>[
  deviceMotoE4,
  sansungJ7Prime,
  pocoX3,
  deviceIPhoneSE2015,
  deviceIPhoneSE2020,
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
