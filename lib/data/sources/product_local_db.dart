import 'package:path/path.dart';
import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:sqflite/sqflite.dart';

class ProductLocalDb {
  static final ProductLocalDb instance = ProductLocalDb._init();
  static Database? _database;

  ProductLocalDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        username TEXT,
        email TEXT,
        city TEXT,
        phone TEXT
      )
    ''');
  }

  Future<void> addToCart(ProductEntity product) async {
    final db = await instance.database;
    db.insert('cart', product.toMap());
  }

  Future<List<ProductEntity>> getCart() async {
    final db = await instance.database;
    final result = await db.query('cart');
    return result.map((e) => ProductEntity.fromMap(e)).toList();
  }
}
