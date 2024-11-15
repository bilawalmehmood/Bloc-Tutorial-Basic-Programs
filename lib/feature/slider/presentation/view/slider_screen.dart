import 'dart:developer';

import 'package:bloc_prectice/feature/slider/presentation/bloc/slider_bloc.dart';
import 'package:bloc_prectice/feature/slider/presentation/bloc/slider_event.dart';
import 'package:bloc_prectice/feature/slider/presentation/bloc/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<SliderBloc, SliderState>(
            buildWhen: (previous, current) => previous.switchValue != current.switchValue,
            builder: (context, state) {
            log('Switch Value: ${state.switchValue}');
            return Switch(value:state.switchValue, onChanged: (bool value){
              
              context.read<SliderBloc>().add(SwitchChanged(value));
            });
          }),
          BlocBuilder<SliderBloc, SliderState>(
            buildWhen: (previous, current) => previous.value != current.value,
            builder: (context, state) {
            log('Color Opisty: ${state.value}');
            return  Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(state.value),
            ),
          );
          }),
          
          const SizedBox(height: 20),
          BlocBuilder<SliderBloc, SliderState>(
            buildWhen: (previous, current) => previous.value != current.value,
            builder: (context, state) {
            log('Slider Value: ${state.value}');
            return Slider(
              value: state.value,
              onChanged: (double value) {
                context.read<SliderBloc>().add(SliderChanged(value));
              },
            );
          }),
          BlocBuilder<SliderBloc, SliderState>(
            buildWhen: (previous, current) => previous.value != current.value,
            builder: (context, state) {
            log('Text Value: ${state.value}');
            return Text(
            'Color Opacity: ${state.value.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium,
          );
          }),
        ],
      ),
    );
  }
}
