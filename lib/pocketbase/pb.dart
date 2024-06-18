import 'package:login_page/constants/constants.dart';
import 'package:pocketbase/pocketbase.dart';

class PocketBaseService {
  static final PocketBaseService _instance = PocketBaseService._internal();

  late PocketBase pb;

  factory PocketBaseService() {
    return _instance;
  }

  PocketBaseService._internal() {
    pb = PocketBase(Url().pocketbaseUrl);
  }
}
