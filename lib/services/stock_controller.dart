import 'dart:collection';

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

  // Future<List<Stock>> fetchStock() async {
  //   List<Stock> stocks = [];
  //   http.Response response = await http.get(Uri.parse('https://api.twelvedata.com/stocks'));
  //   if(response.statusCode == 200) {
  //     String jsonString = response.body;
  //     stocks = jsonDecode(jsonString);
  //   }
  //   return stocks;
  // }

  // Future<List<Stock>> fetchStock() async {
  //   List<Stock> _stocks = [];
  //   http.Response response = await http.get(Uri.parse('https://api.twelvedata.com/stocks?apikey=f32767965dbd48a9b080e3e6900891e9'), headers: {"Accept":"application/json"});
  //   if(response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     var rest = data["symbol"]["name"] as List;
  //     _stocks = rest.map<Stock>((json)=>Stock.fromJson(json)).toList();
  //   }
  //   return _stocks;
  // }

}