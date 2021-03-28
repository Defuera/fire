import 'package:json_annotation/json_annotation.dart';

part 'historical_data_model.g.dart';


@JsonSerializable()
class HistoricalData{

  // @JsonKey(name: "Meta Data")
  // Meta metaData;
  @JsonKey(name: "Monthly Time Series")
  Map<String, Ticker> monthlyTimeSeries;

}

@JsonSerializable()
class Ticker {

  @JsonKey(name: '1. open')
  double open;
  @JsonKey(name: '2. high')
  double high;
  @JsonKey(name: '3. low')
  double low;
  @JsonKey(name: '4. close')
  double close;
  @JsonKey(name: '5. volume')
  double volume;
// "1. open": "690.1100",
// "2. high": "721.1100",
// "3. low": "539.4900",
// "4. close": "618.7100",
// "5. volume": "840157950"
}

// {
// "Meta Data": {
// "1. Information": "Monthly Prices (open, high, low, close) and Volumes",
// "2. Symbol": "TSLA",
// "3. Last Refreshed": "2021-03-26",
// "4. Time Zone": "US/Eastern"
// },
// "Monthly Time Series": {
// "2021-03-26": {
// "1. open": "690.1100",
// "2. high": "721.1100",
// "3. low": "539.4900",
// "4. close": "618.7100",
// "5. volume": "840157950"
// },