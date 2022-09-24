import 'package:api_example/services/stock.dart';
import 'package:api_example/services/stock_controller.dart';
import 'package:api_example/stock_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {

  List<Stock> _watchList = WatchList.watchList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Watch list'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => StockList()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _watchList.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_watchList[index].exchange),
                    Text(_watchList[index].symbol),
                  ],
                ),
                subtitle: Text(_watchList[index].name),
                trailing: ElevatedButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      WatchList.watchList.removeAt(index);
                    });
                  },
                ),
              ),
            );
          }
      ),
    );
  }
}
