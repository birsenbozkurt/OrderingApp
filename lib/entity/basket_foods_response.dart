// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ordering_app/entity/basket_foods.dart';

class BasketFoodsResponse {
  List<BasketFoods> sepet_yemekler;
  int success;
  BasketFoodsResponse({
    required this.sepet_yemekler,
    required this.success,
  });
  factory BasketFoodsResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["sepet_yemekler"] as List;
    List<BasketFoods> sepetYemekler = jsonArray.map((object) => BasketFoods.fromJson(object)).toList();

    return BasketFoodsResponse(sepet_yemekler: sepetYemekler, success: json["success"] as int);
  }
}
