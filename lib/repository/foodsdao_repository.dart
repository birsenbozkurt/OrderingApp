import 'dart:convert';
import 'package:ordering_app/entity/basket_foods.dart';
import 'package:ordering_app/entity/foods.dart';
import 'package:ordering_app/entity/foods_response.dart';
import 'package:ordering_app/entity/basket_foods_response.dart';
import 'package:http/http.dart' as http;

class FoodsDaoRepository {
  List<Foods> parseFoodsResponse(String response) {
    return FoodsResponse.fromJson(json.decode(response)).yemekler;
  }

  List<BasketFoods> parseBasketFoodsResponse(String response) {
    return BasketFoodsResponse.fromJson(json.decode(response)).sepet_yemekler;
  }

  Future<List<Foods>> tumYemekleriGetir() async {
    //get
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var response = await http.get(url);
    return parseFoodsResponse(response.body);
  }

  Future<List<BasketFoods>> sepettekiYemekleriGetir(String kullanici_adi) async {
    //Map'in değer kısmı string olur http den dolayı...
    //post
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var data = {"kullanici_adi": kullanici_adi};
    var response = await http.post(url, body: data);
    return parseBasketFoodsResponse(response.body);
  }

  Future<void> sepeteYemekEkle(String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var data = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat.toString(),
      "yemek_siparis_adet": yemek_siparis_adet.toString(),
      "kullanici_adi": kullanici_adi
    };

    var respoonse = await http.post(url, body: data);
  }

  Future<void> sepettenYemekSil(int sepet_yemek_id, String kullanici_adi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var data = {"Sepet_yemek_id": sepet_yemek_id.toString(), "kullanici_adi": kullanici_adi};
    var response = await http.post(url, body: data);
  }
}
