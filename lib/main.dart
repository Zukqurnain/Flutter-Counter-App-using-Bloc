import 'package:bloc_app/CounterBlock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
          create: (_) => CounterBloc(),
          child: MyHomePage(
            title: "Counter App using Bloc",
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, int>(builder: (_, count) {
        return Center(
          child: Text(
            '$count',
            style: TextStyle(
                fontSize: 100,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                {context.bloc<CounterBloc>().add(CounterEvents.increment)},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () =>
                {context.bloc<CounterBloc>().add(CounterEvents.reset)},
            tooltip: 'reset',
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () =>
                {context.bloc<CounterBloc>().add(CounterEvents.decrement)},
            tooltip: 'decrement',
            child: Icon(Icons.remove),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
