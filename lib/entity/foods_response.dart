// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ordering_app/entity/foods.dart';

class FoodsResponse {
  List<Foods> yemekler;
  int success;
  FoodsResponse({
    required this.yemekler,
    required this.success,
  });

  factory FoodsResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["yemekler"] as List;
    List<Foods> yemeklerListesi = jsonArray.map((jsonArrayObject) => Foods.fromJson(jsonArrayObject)).toList();
    int success = json["success"] as int;
    return FoodsResponse(yemekler: yemeklerListesi, success: success);
  }
}
