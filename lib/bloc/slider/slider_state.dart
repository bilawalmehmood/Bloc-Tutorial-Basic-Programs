import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final double value;
  final bool switchValue;

  const SliderState({
    this.value = 0.5,
    this.switchValue = true,
  });

  SliderState copyWith({
    double? value,
    bool? switchValue,
  }) {
    return SliderState(
      value: value ?? this.value,
      switchValue: switchValue ?? this.switchValue,
    );
  }

  @override
  List<Object?> get props => [value, switchValue];
}