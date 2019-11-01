import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SettingsState extends Equatable {
  const SettingsState({@required this.theme}) : assert(theme != null);

  final ThemeData theme;

  @override
  List<Object> get props => [theme];
}
