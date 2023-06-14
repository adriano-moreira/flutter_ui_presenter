#!/usr/bin/env bash
set -ex
flutter --version
flutter doctor
flutter pub get
flutter analyze
dart format --set-exit-if-changed lib/ test/
flutter test --coverage
flutter test --machine
