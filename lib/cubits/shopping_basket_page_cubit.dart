import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/repository/foodsdao_repository.dart';

class ShoppingBasketPageCubit extends Cubit {
  ShoppingBasketPageCubit() : super(0);

  var frepo = FoodsDaoRepository();
}
