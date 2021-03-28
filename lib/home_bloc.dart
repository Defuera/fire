import 'package:bloc/bloc.dart';
import 'package:fire/model/historical_data_api.dart';
import 'package:fire/model/historical_data_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final api = Api();

  HomeBloc() : super(HomeState()) {
    add(Init());
  }

  @override
  Stream<HomeState> mapEventToState(event) async* {
    if (event is Init) {
      final result = await api.getHistoricalData('TSLA');
      yield HomeState(historicalData: result);
    } else if (event is UpdateSymbol) {
    } else if (event is UpdateAmount) {
    } else if (event is UpdateCurrency) {
    } else if (event is UpdatePeriod) {}
  }
}

class HomeState {

  final HistoricalData? historicalData;
  HomeState({this.historicalData});

}

abstract class HomeEvent {}

class Init extends HomeEvent {}

class UpdateSymbol {
  final String symbol;

  UpdateSymbol(this.symbol);
}

class UpdateAmount {
  final int amount;

  UpdateAmount(this.amount);
}

class UpdateCurrency {
  final String currency;

  UpdateCurrency(this.currency);
}

class UpdatePeriod {
  final String period;

  UpdatePeriod(this.period);
}
