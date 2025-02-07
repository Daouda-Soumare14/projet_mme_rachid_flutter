import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  var name = ''.obs;
  var prenom = ''.obs;
  var email = ''.obs;

  void updateUser({required newName, required newPrenom, required newEmail}) {
    name.value = newName;
    prenom.value = newPrenom;
    email.value = newEmail;
  }
}
