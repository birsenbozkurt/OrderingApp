// ignore_for_file: public_member_api_docs, sort_constructors_first
class Foods {
  String yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  Foods({
    required this.yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat,
  });

  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(
        yemek_id: json["yemek_id"] as String,
        yemek_adi: json["yemek_adi"] as String,
        yemek_resim_adi: json["yemek_resim_adi"] as String,
        yemek_fiyat: json["yemek_fiyat"] as String);
  }
}
