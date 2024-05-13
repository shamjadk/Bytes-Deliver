import 'package:objectbox/objectbox.dart';

@Entity()
class CartEntityModel {
  @Id()
  int id = 0;
  String title;
  int price;
  String image;
  String type;

  CartEntityModel({
    required this.title,
    required this.price,
    required this.image,
    required this.type,
  });
}