import 'package:bytes_deliver/model/cart_entity_model/cart_entity_model.dart';
import 'package:bytes_deliver/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CartStore {
  static CartStore? _instance;
  final Store store;
  late final Box<CartEntityModel> cartBox;

  CartStore._create(this.store) {
    cartBox = store.box<CartEntityModel>();
  }

  static CartStore get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'cart'));
      _instance = CartStore._create(store);
    }
  }
}
