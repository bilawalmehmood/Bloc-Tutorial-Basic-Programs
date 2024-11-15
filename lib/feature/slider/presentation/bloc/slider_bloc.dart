import 'package:bloc/bloc.dart';
import 'package:bloc_prectice/feature/slider/presentation/bloc/slider_event.dart';
import 'package:bloc_prectice/feature/slider/presentation/bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(const SliderState()){
    on<SliderChanged>(_onSliderChanged);
    on<SwitchChanged>(_onSwitchChanged);
  }

  void _onSliderChanged(SliderChanged event, Emitter<SliderState> emit) {
    emit(state.copyWith(value: event.value));
  }

  void _onSwitchChanged(SwitchChanged event, Emitter<SliderState> emit) {
    emit(state.copyWith(switchValue: event.value));
  }

}