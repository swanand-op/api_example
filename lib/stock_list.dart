import 'package:api_example/services/stock_controller.dart';
import 'package:api_example/watch_list_page.dart';
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
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WatchListPage())
            );
          }, icon: Icon(Icons.arrow_forward))
        ],
        title: Text("Stock List"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map>>(
        future: _stockList,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("error occurred ${snapshot.error}"),);
          }
          if(snapshot.hasData) {
            List<dynamic> stocks = snapshot.data;
            return ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(stocks[index]['exchange'],style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(stocks[index]['symbol'])
                      ],
                    ),
                    subtitle: Text(stocks[index]['name']),
                    trailing: ElevatedButton(
                      child: Icon(Icons.add,),
                      onPressed: (){
                        WatchList watchList = WatchList();
                        watchList.getStock(stocks[index]['symbol'], stocks[index]['name'], stocks[index]['exchange']);
                      },
                    ),
                  ),
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
