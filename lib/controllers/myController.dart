import 'package:get/get.dart';

class MyController extends GetxController {
  RxInt selectedColor = 0.obs;

  List<Map> roles = [
    {
      'roleImage': 'assets/icons/select_partner/Pet Shop.png',
      'roleName': "pet shop",
      'roleDescription': 'Sell Your Products to Pet Lovers',
      'homeIndex': 0,
    },
    {
      'roleImage': 'assets/icons/select_partner/Sitter.png',
      'roleName': "Sitter",
      'roleDescription': 'Provide Pet Sitter Services',
      'homeIndex': 1,
    },
    {
      'roleImage': 'assets/icons/select_partner/Vets Clinic.png',
      'roleName': "Vets Clinic",
      'roleDescription': 'Do Appointments with Pet Lovers',
      'homeIndex': 2,
    },
    {
      'roleImage': 'assets/icons/select_partner/Groomer.png',
      'roleName': "Groomer",
      'roleDescription': 'Do Grooming Appointments with Pet Lovers',
      'homeIndex': 3,
    },
    {
      'roleImage': 'assets/icons/select_partner/Aglity Trainer.png',
      'roleName': "Aglity Trainer",
      'roleDescription': 'Train Pets Different Skills',
      'homeIndex': 4,
    },
    {
      'roleImage': 'assets/icons/select_partner/Govertment.png',
      'roleName': "Govertment",
      'roleDescription': 'Renew Pets Licences and Apply For Pets Passport',
      'homeIndex': 5,
    },
  ].obs;

  toggleColor(index) {
    selectedColor.value = index;
    update();
  }
}
