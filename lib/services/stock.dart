class Stock {
  Data data;
  String symbol, name;
  Stock({required this.data, required this.symbol, required this.name});
  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      data: Data.fromJson(json["data"]),
      symbol: json["symbol"] as String,
      name: json["name"] as String,
    );
  }
}

class Data {
  String name;
  Data({required this.name});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json["data"],
    );
  }
}