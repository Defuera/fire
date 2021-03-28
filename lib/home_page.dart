import 'package:fire/home_bloc.dart';
import 'package:fire/model/historical_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
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
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                            style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 48),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixText: 'EUR',
                            )),
                        Text(
                          'every month for last $_years years in ',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        if (state.historicalData != null) ...buildList(state.historicalData),
                      ],
                    ),
                  ),
                )),
      );

  List<Widget> buildList(HistoricalData? historicalData) {
    if (historicalData == null) {
      return [Container()];
    }

    final list = List<Widget>.empty(growable: true);

    historicalData.monthlyTimeSeries.forEach((key, value) => list.add(Text('$key: ${value.low}')));
    return list;
  }
}
