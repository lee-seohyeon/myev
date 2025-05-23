class ElectricCar {
  final String brand;          // 브랜드
  final String modelName;      // 모델명
  final DateTime releaseDate;  // 출시일
  final int range;            // 주행거리 (km)
  final int chargingTime;     // 충전 시간 (분)
  final int price;            // 가격 (만원)
  final int subsidy;          // 보조금 (만원)
  final double batteryCapacity; // 배터리 용량 (kWh)
  final Map<String, bool> features; // 기타 기능 (OTA, 자율주행 등)
  final String? imageUrl;     // 차량 이미지 URL

  const ElectricCar({
    required this.brand,
    required this.modelName,
    required this.releaseDate,
    required this.range,
    required this.chargingTime,
    required this.price,
    required this.subsidy,
    required this.batteryCapacity,
    required this.features,
    this.imageUrl,
  });

  // JSON 직렬화
  Map<String, dynamic> toJson() => {
    'brand': brand,
    'modelName': modelName,
    'releaseDate': releaseDate.toIso8601String(),
    'range': range,
    'chargingTime': chargingTime,
    'price': price,
    'subsidy': subsidy,
    'batteryCapacity': batteryCapacity,
    'features': features,
    'imageUrl': imageUrl,
  };

  // JSON 역직렬화
  factory ElectricCar.fromJson(Map<String, dynamic> json) => ElectricCar(
    brand: json['brand'] as String,
    modelName: json['modelName'] as String,
    releaseDate: DateTime.parse(json['releaseDate'] as String),
    range: json['range'] as int,
    chargingTime: json['chargingTime'] as int,
    price: json['price'] as int,
    subsidy: json['subsidy'] as int,
    batteryCapacity: json['batteryCapacity'] as double,
    features: Map<String, bool>.from(json['features'] as Map),
    imageUrl: json['imageUrl'] as String?,
  );

  // 실구매가 계산
  int get actualPrice => price - subsidy;
} 