import 'package:pocketbase/pocketbase.dart';

class PocketBaseService {
  static final PocketBaseService _instance = PocketBaseService._internal();

  late PocketBase pb;

  factory PocketBaseService() {
    return _instance;
  }

  PocketBaseService._internal() {
    const pocketbaseUrl = String.fromEnvironment('POCKETBASE_URL');
    pb = PocketBase(pocketbaseUrl);
  }
}
