import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/entity/basket_foods.dart';
import 'package:ordering_app/repository/foodsdao_repository.dart';

class BasketPageCubit extends Cubit<List<BasketFoods>> {
  BasketPageCubit() : super(<BasketFoods>[]);

  var frepo = FoodsDaoRepository();

  Future<void> sepettekiYemekleriYukle(String kullanici_adi) async {
    var liste = await frepo.sepettekiYemekleriGetir(kullanici_adi);
    emit(liste);
  }

  Future<void> yemekSil(int sepet_yemek_id, String kullanici_adi) async {
    await frepo.sepettenYemekSil(sepet_yemek_id, kullanici_adi);
    await sepettekiYemekleriYukle(kullanici_adi);
  }
}
