import 'dart:convert';
import 'package:ordering_app/entity/foods.dart';
import 'package:ordering_app/entity/foods_response.dart';
import 'package:http/http.dart' as http;

class FoodsDaoRepository {
  List<Foods> parseFoodsResponse(String response) {
    return FoodsResponse.fromJson(json.decode(response)).yemekler;
  }

  Future<List<Foods>> tumYemekleriGetir() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var response = await http.get(url);
    return parseFoodsResponse(response.body);
  }
}
