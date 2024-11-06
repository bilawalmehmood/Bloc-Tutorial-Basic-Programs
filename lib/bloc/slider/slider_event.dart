import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class SliderChanged extends SliderEvent {
  final double value;

  const SliderChanged(this.value);

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'SliderChanged { value: $value }';
}

class SwitchChanged extends SliderEvent {
  final bool value;

  const SwitchChanged(this.value);

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'SwitchChanged { value: $value }';
}