class CounterState {

  final int counter;


  CounterState._(this.counter);

  factory CounterState.nextState(int times) => CounterState._(times);

}