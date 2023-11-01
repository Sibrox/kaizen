#! /bin/bash

dart format .
dart fix --apply
flutter analyze
flutter test
