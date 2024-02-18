class CustomLocationModel {
  final double? lat;
  final double? long;
  final String? name;
  final String? nickName;

  CustomLocationModel(this.lat, this.long, this.name, this.nickName);

  CustomLocationModel.fromJson(Map<String, dynamic> location)
      : lat = location['lat'] as double,
        long = location['long'] as double,
        name = location['name'] as String,
        nickName = location['nickName'] as String;

  Map<String, dynamic> toJson() => {
        'lat': lat ?? 0.0,
        'long': long ?? 0.0,
        'name': name ?? "",
        'nickName': nickName ?? ""
  };
}