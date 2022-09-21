import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/repository/foodsdao_repository.dart';

class FoodDetailCubit extends Cubit<void> {
  FoodDetailCubit() : super(0);

  var frepo = FoodsDaoRepository();

  Future<void> YemekEkle(String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    await frepo.sepeteYemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }
}
