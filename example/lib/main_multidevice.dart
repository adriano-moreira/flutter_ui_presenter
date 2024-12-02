import 'package:flutter_ui_presenter/flutter_ui_presenter.dart';

import 'src/scroll_page.dart';

void main() {
  runPresenterMultiDevice(
    template: Template(
      name: 'Page',
      builder: (_) => ScrollPage(),
    ),
  );
}
