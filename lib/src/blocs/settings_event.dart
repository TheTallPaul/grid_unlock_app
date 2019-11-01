import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {}

class ThemeToggled extends SettingsEvent {
  @override
  List<Object> get props => [];
}