import 'package:get_storage/get_storage.dart';

class GetStorageHelper {
  static GetStorage? _box;

  static GetStorage get_box(String name) {
    if (_box == null) _box = GetStorage(name);
    return _box!;
  }
}
