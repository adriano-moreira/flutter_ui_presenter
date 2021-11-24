import 'package:flutter/material.dart';

class _Item {
  final String title;
  final String subtitle;

  _Item({
    required this.title,
    required this.subtitle,
  });
}

class _ItemWidget extends StatelessWidget {
  final _Item item;

  const _ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.subtitle),
    );
  }
}

class ScrollPage extends StatelessWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final sc = ScrollConfiguration.of(context);
    final items = <_Item>[
      _Item(
        title: 'mediaQuery.size',
        subtitle:
            '${mq.size.width.toStringAsFixed(2)} x ${mq.size.height.toStringAsFixed(2)}',
      ),
      _Item(
        title: 'mediaQuery.padding',
        subtitle: '${mq.padding}',
      ),
      _Item(
        title: 'mediaQuery.devicePixelRatio',
        subtitle: mq.devicePixelRatio.toStringAsFixed(2),
      ),
      _Item(
        title: 'mediaQuery.platformBrightness',
        subtitle: mq.platformBrightness.toString(),
      ),
      _Item(
        title: 'scrollConfiguration.getPlatform',
        subtitle: sc.getPlatform(context).toString(),
      ),
      _Item(
        title: 'scrollConfiguration.dragDevices',
        subtitle: sc.dragDevices.toString(),
      ),
      ...List.generate(25, (index) {
        return _Item(title: index.toString(), subtitle: '');
      }).toList()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _ItemWidget(item: item);
        },
      ),
    );
  }
}
