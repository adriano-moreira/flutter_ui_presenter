import 'package:flutter/material.dart';

import 'presenters/multi_device.dart';
import 'presenters/multi_template_ui_presenter.dart';
import 'presenters/single_device.dart';
import 'template.dart';

void runUiPresenter({required List<Template> templates}) {
  runApp(
    MaterialApp(
      home: UiPresenter.multiTemplates(
        templates: templates,
      ),
    ),
  );
}

void runPresenterSingleDevice({required Template template}) {
  runApp(
    MaterialApp(
      home: UiPresenter.singleDevice(
        template: template,
      ),
    ),
  );
}

void runPresenterMultiDevice({required Template template}) {
  runApp(
    MaterialApp(
      home: UiPresenter.multiDevice(
        template: template,
      ),
    ),
  );
}

abstract class UiPresenter {
  static Widget singleDevice({required Template template}) {
    return SingleDevice(template: template);
  }

  static Widget multiDevice({required Template template}) {
    return MultiDevice(template: template);
  }

  static Widget multiTemplates({required List<Template> templates}) {
    return MultiTemplate(templates: templates);
  }

  static Widget withSingleDevice(Widget app, {String name = ''}) {
    return SingleDevice(
      template: Template(
        name: name,
        builder: (_) => app,
      ),
    );
  }

  static Widget withMultiDevice(Widget app, {String name = ''}) {
    return SingleDevice(
      template: Template(
        name: name,
        builder: (_) => app,
      ),
    );
  }
}
