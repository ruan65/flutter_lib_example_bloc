import 'package:bloc_lib_example/counter_blocc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CounterWidget extends StatelessWidget {
  final MyHomePage widget;

  const CounterWidget({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<CounterBloc>(context),
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).onDecrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).onIncrement();
              print('incr pressed');

            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _counterBloc, child: CounterWidget(widget: widget));
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
