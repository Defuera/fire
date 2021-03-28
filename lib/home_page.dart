import 'package:fire/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _defaultAmount = 50;
  static const _years = 10;

  final _bloc = HomeBloc();
  final _amountController = TextEditingController(text: '$_defaultAmount');

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
            bloc: _bloc,
            builder: (context, state) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'How much money would I have if I would be investing',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            controller: _amountController,
                            style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 48),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixText: 'EUR',
                            )),
                        Text(
                          'every month for last $_years years in ',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )),
      );
}
