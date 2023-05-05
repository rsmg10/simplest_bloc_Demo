import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
@immutable
abstract class BaseEvent{
  const BaseEvent();
}
@immutable
abstract class ButtonEvent extends BaseEvent{
  const ButtonEvent();
}
@immutable
class ButtonEventInc implements ButtonEvent {
  const ButtonEventInc();
}
@immutable
class ButtonEventDec implements ButtonEvent {
  const ButtonEventDec();
}

@immutable
class ButtonState {
  final int number;
  const ButtonState({required this.number});
}

class AppBloc extends Bloc<ButtonEvent, ButtonState> {
  //AppBloc(super.initialState);
  AppBloc() : super(ButtonState(number: 0)) {
    on<ButtonEventInc>(

      (event, emit) {

        emit(ButtonState(number: state.number + 1));
      },
    );
    on<ButtonEventDec>(
          (event, emit) {
            emit(ButtonState(number: state.number - 1));
      },
    );
  }
}
