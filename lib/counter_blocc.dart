import 'package:bloc/bloc.dart';
import 'package:bloc_lib_example/CounterState.dart';
import 'package:bloc_lib_example/counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  @override
  CounterState get initialState => CounterState.nextState(0);

  @override
  Stream<CounterState> mapEventToState(
    CounterState currentState,
    CounterEvent event,
  ) async* {

    if(event is IncrementEvent) {
      yield CounterState.nextState(currentState.counter + 1);
    } else if(event is DecrementEvent) {
      yield CounterState.nextState(currentState.counter - 1);
    }
  }

  void onIncrement() {
    dispatch(IncrementEvent());

  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }
}
