import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController {
  int _selectedIndex = 0; // ✅ private variable

  int get selectedIndex => _selectedIndex; // ✅ getter

  void changeIndex(int index) {
    _selectedIndex = index;
    update(); // ✅ notify UI
  }

  void moveToCategory(){
    changeIndex(1);
  }

  void backToHome(){
    changeIndex(0);
  }

}
