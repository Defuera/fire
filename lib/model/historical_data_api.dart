import 'dart:convert';

import 'package:fire/model/historical_data_model.dart';
import 'package:http/http.dart' as http;

const apiKey = 'EF42SLKVWGO6N7KT';

class Api {
  Future<HistoricalData> getHistoricalData(String symbol) async {
    final url = Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol=$symbol&apikey=$apiKey');
    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response status: ${response.body}');

    return HistoricalData.fromJson(json.decode(response.body) as Map<String, dynamic>);
  }
}
