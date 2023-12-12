import 'package:get/state_manager.dart';

class HommVM extends GetxController {
  RxInt number = 0.obs;
  int x = 0;

  addOnbe() {
    number++;
    x++;
  
  }

  minusOnee() {
    number--;
    x--;
  }
}
