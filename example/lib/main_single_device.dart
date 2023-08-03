import 'package:flutter/widgets.dart';
import 'package:flutter_ui_presenter/flutter_ui_presenter.dart';

import 'src/scroll_page.dart';

void main() {
  runApp(
    UiPresenter.withSingleDevice(
      ScrollPage(),
    ),
  );
}
