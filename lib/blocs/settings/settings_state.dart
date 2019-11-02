import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  const SettingsState(this.theme, this.darkMode);

  final ThemeData theme;
  final bool darkMode;

  @override
  List<Object> get props => [theme, darkMode];
}
