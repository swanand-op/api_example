import 'package:api_example/services/stock.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StockController {

  Future<List<Map>> fetchStock() async {
    List<Map> stocks = [];
    http.Response response = await http.get(Uri.parse('https://api.twelvedata.com/stocks?exchange=nse'));
    if(response.statusCode == 200){
      String jsonString = response.body;
      List data = jsonDecode(jsonString)['data'];
      stocks = data.cast<Map>();
    }
    return stocks;
  }

}

class WatchList {
  static List<Stock> watchList = [];
  List<Stock> getStock(String symbol, name, exchange) {
    Stock stock = Stock(symbol, name, exchange);
    watchList.add(stock);
    return watchList;
  }
}