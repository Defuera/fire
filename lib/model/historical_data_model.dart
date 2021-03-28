import 'package:json_annotation/json_annotation.dart';

part 'historical_data_model.g.dart';


@JsonSerializable()
class HistoricalData{

  // @JsonKey(name: "Meta Data")
  // Meta metaData;
  @JsonKey(name: "Monthly Time Series")
  final Map<String, Ticker> monthlyTimeSeries;

  HistoricalData(this.monthlyTimeSeries);
  
  factory HistoricalData.fromJson(Map<String, dynamic> json) => _$HistoricalDataFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalDataToJson(this);
}

@JsonSerializable()
class Ticker {

  @JsonKey(name: '1. open')
  String open;
  @JsonKey(name: '2. high')
  String high;
  @JsonKey(name: '3. low')
  String low;
  @JsonKey(name: '4. close')
  String close;
  @JsonKey(name: '5. volume')
  String volume;

  Ticker(this.open, this.close, this.high, this.low, this.volume);
  
  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);

  Map<String, dynamic> toJson() => _$TickerToJson(this);
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