import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/entity/foods.dart';
import 'package:ordering_app/repository/foodsdao_repository.dart';

class HomePageCubit extends Cubit<List<Foods>> {
  HomePageCubit() : super(<Foods>[]);

  var frepo = FoodsDaoRepository();

  Future<void> yemekleriYukle() async {
    var liste = await frepo.tumYemekleriGetir();
    emit(liste);
  }
}
