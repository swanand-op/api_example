import 'package:api_example/services/stock_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockList extends StatefulWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {

  Future<List<Map>> _stockList = StockController().fetchStock();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock List"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map>>(
        future: _stockList,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("error occoured ${snapshot.error}"),);
          }
          if(snapshot.hasData) {
            List<dynamic> stocks = snapshot.data;
            return ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                Map thisStock = stocks[index];
                return ListTile(
                  title: Text('${thisStock['symbol']}'),
                  subtitle: Text('${thisStock['name']}'),
                );
              }
            );
          }
          return Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}
