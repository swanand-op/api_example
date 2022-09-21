import 'dart:collection';

import 'package:http/http.dart' as http;
import 'dart:convert';

class StockController {

  Future<List<Map>> fetchStock() async {
    List<Map> stocks = [];
    http.Response response = await http.get(Uri.parse('https://api.twelvedata.com/stocks'));
    if(response.statusCode == 200){
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      stocks = data.cast<Map>();
    }
    return stocks;
  }

  Future<Map> getStockPrice(symbol) async {
    Map stock = {};
    http.Response response = await http.get(Uri.parse('https://api.twelvedata.com/price?symbol=$symbol&apikey=f32767965dbd48a9b080e3e6900891e9'));
    if(response.statusCode == 200) {
      String jsonString = response.body;
      stock = jsonDecode(jsonString);
    }
    return stock;
  }

}